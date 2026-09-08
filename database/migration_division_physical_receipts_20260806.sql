CREATE TABLE IF NOT EXISTS record_division_receipts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    record_id INT NOT NULL,
    division_name VARCHAR(160) NOT NULL,
    received_by INT NULL,
    received_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_record_division_receipt (record_id, division_name),
    KEY idx_division_receipts_division (division_name, received_at),
    CONSTRAINT fk_division_receipts_record FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE,
    CONSTRAINT fk_division_receipts_user FOREIGN KEY (received_by) REFERENCES users(id) ON DELETE SET NULL
);
