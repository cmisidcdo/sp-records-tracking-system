ALTER TABLE record_attachments
ADD COLUMN title VARCHAR(255) NULL AFTER original_name;
