USE lcd_records;

SET @column_exists := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'users'
    AND COLUMN_NAME = 'nickname'
);

SET @sql := IF(
    @column_exists = 0,
    'ALTER TABLE users ADD COLUMN nickname VARCHAR(80) NULL AFTER name',
    'SELECT ''nickname column already exists'' AS message'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
