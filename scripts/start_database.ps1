[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

$mysqlBin = 'C:\dbase\mysql\bin'
$server = Join-Path $mysqlBin 'mysqld.exe'
$client = Join-Path $mysqlBin 'mysql.exe'
$admin = Join-Path $mysqlBin 'mysqladmin.exe'
$configuration = Join-Path $mysqlBin 'my.ini'
$expectedDataDir = 'c:/dbase/mysql/data'
$expectedIdentity = 'a425b1c5-f742-4dc0-ac3e-084d62f6008e'

function Normalize-DatabasePath([string]$Path) {
    return $Path.Trim().Replace('\', '/').TrimEnd('/').ToLowerInvariant()
}

function Assert-AuthoritativeDatabase {
    $result = & $client -h 127.0.0.1 -P 3306 -u root -N -r -e `
        "SELECT @@datadir; SELECT instance_uuid FROM lcd_records.system_identity WHERE identity_id=1;" 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "MariaDB identity query failed: $result"
    }

    $values = @($result | ForEach-Object { $_.ToString().Trim() } | Where-Object { $_ -ne '' })
    if ($values.Count -lt 2) {
        throw 'MariaDB did not return its datadir and instance identity.'
    }

    if ((Normalize-DatabasePath $values[0]) -ne $expectedDataDir -or $values[1] -ne $expectedIdentity) {
        throw "Unexpected MariaDB instance: datadir=$($values[0]) identity=$($values[1])"
    }
}

$listener = Get-NetTCPConnection -State Listen -LocalPort 3306 -ErrorAction SilentlyContinue
if ($listener) {
    Assert-AuthoritativeDatabase
    exit 0
}

Start-Process `
    -FilePath $server `
    -ArgumentList @("--defaults-file=$configuration", '--standalone', '--console') `
    -WorkingDirectory $mysqlBin `
    -WindowStyle Hidden

$deadline = (Get-Date).AddSeconds(30)
do {
    Start-Sleep -Milliseconds 500
    & $admin -h 127.0.0.1 -P 3306 -u root ping *> $null
    if ($LASTEXITCODE -eq 0) {
        Assert-AuthoritativeDatabase
        exit 0
    }
} while ((Get-Date) -lt $deadline)

throw 'Authoritative MariaDB did not become ready within 30 seconds.'
