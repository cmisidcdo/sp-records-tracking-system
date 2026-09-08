ALTER TABLE records
DROP INDEX control_number;

CREATE INDEX idx_records_control_number ON records (control_number);
