CREATE TABLE IF NOT EXISTS record_committees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    record_id INT NOT NULL,
    committee_id INT NOT NULL,
    sequence_no INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_record_committee (record_id, committee_id),
    KEY idx_record_committees_record (record_id),
    KEY idx_record_committees_committee (committee_id),
    CONSTRAINT fk_record_committees_record FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE,
    CONSTRAINT fk_record_committees_committee FOREIGN KEY (committee_id) REFERENCES committees(id) ON DELETE CASCADE
);
