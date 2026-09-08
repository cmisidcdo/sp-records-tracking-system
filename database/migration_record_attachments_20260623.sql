CREATE TABLE IF NOT EXISTS record_attachments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    record_id INT NOT NULL,
    original_name VARCHAR(255) NOT NULL,
    stored_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(120) NOT NULL,
    file_size INT NOT NULL,
    uploaded_by INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_record_attachments_record FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE,
    CONSTRAINT fk_record_attachments_user FOREIGN KEY (uploaded_by) REFERENCES users(id) ON DELETE SET NULL
);
