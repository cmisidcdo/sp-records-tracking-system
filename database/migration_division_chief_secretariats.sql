USE lcd_records;

CREATE TABLE IF NOT EXISTS division_chief_secretariats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    division_chief_user_id INT NOT NULL,
    secretariat_user_id INT NOT NULL,
    assigned_by INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_division_chief_secretariat (division_chief_user_id, secretariat_user_id),
    CONSTRAINT fk_division_chief_secretariats_chief FOREIGN KEY (division_chief_user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_division_chief_secretariats_secretariat FOREIGN KEY (secretariat_user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_division_chief_secretariats_assigned_by FOREIGN KEY (assigned_by) REFERENCES users(id) ON DELETE SET NULL
);

INSERT IGNORE INTO division_chief_secretariats (division_chief_user_id, secretariat_user_id, assigned_by)
SELECT chief.id, sec.id, NULL
FROM users chief
CROSS JOIN users sec
WHERE chief.role = 'division_chief'
AND sec.role = 'secretariat'
AND NOT EXISTS (SELECT 1 FROM division_chief_secretariats);
