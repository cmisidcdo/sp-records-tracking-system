USE lcd_records;

ALTER TABLE records
ADD COLUMN proposed_by_city_council_member TINYINT(1) NOT NULL DEFAULT 0 AFTER remarks;
