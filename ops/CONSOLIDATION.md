# Database consolidation

The only authoritative MariaDB data directory is:

`C:\dbase\mysql\data`

Managed startup is provided by the current-user scheduled task
`SPRecordsMariaDB-Startup`, which runs `scripts\start_database.ps1` at sign-in.
It always uses `C:\dbase\mysql\bin\my.ini`. If an administrator later
replaces the task with a Windows service, use the name `SPRecordsMariaDB` and
the same configuration file.


Do not start MariaDB from any directory below `storage`. Those directories are
retained only as recovery archives.

The application validates both the `system_identity` UUID and the server's
`@@datadir` value on every new database connection. A mismatch intentionally
stops the application before records can be read or written.

Scheduled backups are created below `backups\scheduled` and mirrored to:

`\\192.168.128.97\records section\SP Records System Backups\scheduled`

The nightly task backs up the database. The Sunday task backs up both the
database and `storage\attachments`.
