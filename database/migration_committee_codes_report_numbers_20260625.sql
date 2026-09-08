USE lcd_records;

ALTER TABLE committees
ADD COLUMN committee_code VARCHAR(20) NULL AFTER name;

CREATE TABLE IF NOT EXISTS committee_report_numbers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    record_id INT NOT NULL,
    committee_id INT NOT NULL,
    report_year INT NOT NULL,
    sequence_no INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_committee_report_record (record_id, committee_id, report_year),
    KEY idx_committee_report_counter (committee_id, report_year, sequence_no),
    CONSTRAINT fk_committee_report_record FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE,
    CONSTRAINT fk_committee_report_committee FOREIGN KEY (committee_id) REFERENCES committees(id) ON DELETE CASCADE
);
