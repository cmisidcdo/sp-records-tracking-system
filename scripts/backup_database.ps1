[CmdletBinding()]
param(
    [switch]$IncludeAttachments,
    [string]$MirrorRoot = ''
)

$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$backupRoot = Join-Path $projectRoot 'backups\scheduled'
$mysqlBin = 'C:\dbase\mysql\bin'
$dumpTool = Join-Path $mysqlBin 'mysqldump.exe'
$mysqlTool = Join-Path $mysqlBin 'mysql.exe'
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$pendingDirectory = Join-Path $backupRoot ".pending-$stamp"
$finalDirectory = Join-Path $backupRoot "backup-$stamp"

if (!(Test-Path -LiteralPath $dumpTool -PathType Leaf)) {
    throw "Backup tool not found: $dumpTool"
}

New-Item -ItemType Directory -Path $pendingDirectory -Force | Out-Null

try {
    $dumpPath = Join-Path $pendingDirectory 'lcd_records.sql'
    & $dumpTool `
        --host=127.0.0.1 `
        --port=3306 `
        --user=root `
        --single-transaction `
        --routines `
        --triggers `
        --events `
        --hex-blob `
        --default-character-set=utf8mb4 `
        --databases lcd_records `
        "--result-file=$dumpPath"

    if ($LASTEXITCODE -ne 0 -or !(Test-Path -LiteralPath $dumpPath -PathType Leaf)) {
        throw "Database dump failed with exit code $LASTEXITCODE"
    }

    if ((Get-Item -LiteralPath $dumpPath).Length -lt 1024) {
        throw 'Database dump is unexpectedly small.'
    }

    $identityPath = Join-Path $pendingDirectory 'database-identity.tsv'
    & $mysqlTool -h 127.0.0.1 -P 3306 -u root -B -e `
        "SELECT @@version version, @@datadir datadir, @@log_bin log_bin; SELECT * FROM lcd_records.system_identity; SELECT COUNT(*) record_count, MAX(updated_at) latest_record_update FROM lcd_records.records;" |
        Set-Content -LiteralPath $identityPath -Encoding UTF8

    if ($LASTEXITCODE -ne 0) {
        throw 'Could not record the database identity manifest.'
    }

    Copy-Item -LiteralPath 'C:\dbase\mysql\bin\my.ini' -Destination (Join-Path $pendingDirectory 'my.ini')

    if ($IncludeAttachments) {
        $attachmentsPath = Join-Path $projectRoot 'storage\attachments'
        if (Test-Path -LiteralPath $attachmentsPath -PathType Container) {
            Compress-Archive `
                -LiteralPath $attachmentsPath `
                -DestinationPath (Join-Path $pendingDirectory 'attachments.zip') `
                -CompressionLevel Optimal
        }
    }

    Get-ChildItem -LiteralPath $pendingDirectory -File |
        Get-FileHash -Algorithm SHA256 |
        ForEach-Object { "$($_.Hash) *$([IO.Path]::GetFileName($_.Path))" } |
        Set-Content -LiteralPath (Join-Path $pendingDirectory 'SHA256SUMS.txt') -Encoding ASCII

    Move-Item -LiteralPath $pendingDirectory -Destination $finalDirectory

    if ($MirrorRoot -ne '') {
        New-Item -ItemType Directory -Path $MirrorRoot -Force | Out-Null
        Copy-Item -LiteralPath $finalDirectory -Destination $MirrorRoot -Recurse
    }

    Write-Output "Backup completed: $finalDirectory"
} catch {
    Write-Error "Backup did not complete. Pending files were retained at $pendingDirectory. $($_.Exception.Message)"
    throw
}
