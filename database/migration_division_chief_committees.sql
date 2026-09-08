USE lcd_records;

CREATE TABLE IF NOT EXISTS committee_division_chiefs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    committee_id INT NOT NULL,
    user_id INT NOT NULL,
    assigned_by INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_committee_division_chief (committee_id, user_id),
    CONSTRAINT fk_committee_division_chiefs_committee FOREIGN KEY (committee_id) REFERENCES committees(id) ON DELETE CASCADE,
    CONSTRAINT fk_committee_division_chiefs_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_committee_division_chiefs_assigned_by FOREIGN KEY (assigned_by) REFERENCES users(id) ON DELETE SET NULL
);

INSERT IGNORE INTO committee_division_chiefs (committee_id, user_id, assigned_by)
SELECT c.id, u.id, NULL
FROM committees c
CROSS JOIN users u
WHERE u.role = 'division_chief'
AND NOT EXISTS (SELECT 1 FROM committee_division_chiefs);
