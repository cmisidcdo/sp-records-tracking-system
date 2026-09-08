USE lcd_records;

ALTER TABLE city_officials
MODIFY officer_role ENUM(
    'Presiding Officer',
    'Presiding Officer Pro-Tempore',
    'Majority Floor Leader',
    'Assistant Majority Floor Leader',
    'Minority Floor Leader',
    'Assistant Minority Floor Leader',
    'SK Federation President',
    'IPMR Representative',
    'Association of Barangay Captain President'
) NULL;
