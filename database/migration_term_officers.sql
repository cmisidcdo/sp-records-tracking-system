USE lcd_records;

ALTER TABLE city_officials
MODIFY position ENUM(
    'Vice Mayor',
    'City Councilor',
    'Presiding Officer',
    'Presiding Officer Pro-Tempore',
    'Majority Floor Leader',
    'Assistant Majority Floor Leader',
    'Minority Floor Leader',
    'Assistant Minority Floor Leader'
) NOT NULL DEFAULT 'City Councilor';
