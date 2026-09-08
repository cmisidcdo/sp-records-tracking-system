ALTER TABLE users
MODIFY role ENUM('admin', 'city_secretary', 'division_chief', 'receiving_clerk', 'secretariat', 'division_staff', 'records_officer', 'staff') NOT NULL DEFAULT 'secretariat';
