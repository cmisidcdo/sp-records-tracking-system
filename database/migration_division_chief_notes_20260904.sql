CREATE TABLE IF NOT EXISTS division_chief_notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    record_id INT NOT NULL,
    note_text TEXT NOT NULL,
    reminder_at DATETIME NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    KEY idx_division_chief_notes_user_updated (user_id, updated_at),
    KEY idx_division_chief_notes_user_reminder (user_id, reminder_at),
    KEY idx_division_chief_notes_record (record_id),
    CONSTRAINT fk_division_chief_notes_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_division_chief_notes_record FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE
);
