USE lcd_records;

ALTER TABLE records
MODIFY status ENUM('Received', 'For Review', 'For Printing', 'In Committee', 'For Action', 'Completed', 'Archived') NOT NULL DEFAULT 'Received';
