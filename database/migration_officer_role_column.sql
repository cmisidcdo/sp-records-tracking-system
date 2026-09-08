USE lcd_records;

ALTER TABLE city_officials
ADD COLUMN officer_role ENUM(
    'Presiding Officer',
    'Presiding Officer Pro-Tempore',
    'Majority Floor Leader',
    'Assistant Majority Floor Leader',
    'Minority Floor Leader',
    'Assistant Minority Floor Leader'
) NULL AFTER position;

UPDATE city_officials
SET officer_role = position,
    position = CASE WHEN position = 'Presiding Officer' THEN 'Vice Mayor' ELSE 'City Councilor' END
WHERE position IN (
    'Presiding Officer',
    'Presiding Officer Pro-Tempore',
    'Majority Floor Leader',
    'Assistant Majority Floor Leader',
    'Minority Floor Leader',
    'Assistant Minority Floor Leader'
);

ALTER TABLE city_officials
MODIFY position ENUM('Vice Mayor', 'City Councilor') NOT NULL DEFAULT 'City Councilor';
