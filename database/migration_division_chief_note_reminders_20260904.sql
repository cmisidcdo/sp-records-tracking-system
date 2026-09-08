ALTER TABLE division_chief_notes
    ADD COLUMN reminder_at DATETIME NULL AFTER note_text,
    ADD KEY idx_division_chief_notes_user_reminder (user_id, reminder_at);
