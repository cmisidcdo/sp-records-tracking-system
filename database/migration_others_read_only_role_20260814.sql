USE lcd_records;

ALTER TABLE users
MODIFY role ENUM(
    'admin',
    'city_secretary',
    'division_chief',
    'receiving_clerk',
    'secretariat',
    'division_staff',
    'administrative_support',
    'others',
    'records_officer',
    'staff'
) NOT NULL DEFAULT 'secretariat';

UPDATE users
SET division_name = 'Others'
WHERE role = 'others';
