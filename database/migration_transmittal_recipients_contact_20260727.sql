ALTER TABLE records
    ADD COLUMN IF NOT EXISTS contact_number VARCHAR(80) NULL AFTER client_name;

ALTER TABLE records
    ADD COLUMN IF NOT EXISTS client_email VARCHAR(180) NULL AFTER contact_number;

CREATE TABLE IF NOT EXISTS record_recipients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    record_id INT NOT NULL,
    title VARCHAR(80) NULL,
    name VARCHAR(180) NOT NULL,
    position VARCHAR(180) NULL,
    address TEXT NULL,
    contact_number VARCHAR(80) NULL,
    created_by INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    KEY idx_record_recipients_record (record_id),
    CONSTRAINT fk_record_recipients_record FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE,
    CONSTRAINT fk_record_recipients_created_by FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);
