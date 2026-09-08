USE lcd_records;

ALTER TABLE users
MODIFY role ENUM('admin', 'city_secretary', 'division_chief', 'receiving_clerk', 'secretariat', 'division_staff', 'records_officer', 'staff') NOT NULL DEFAULT 'secretariat';

UPDATE users SET role = 'city_secretary' WHERE role = 'admin';
UPDATE users SET role = 'receiving_clerk' WHERE role = 'records_officer';
UPDATE users SET role = 'secretariat' WHERE role = 'staff';

CREATE TABLE IF NOT EXISTS committee_secretariats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    committee_id INT NOT NULL,
    user_id INT NOT NULL,
    assigned_by INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_committee_secretariat (committee_id, user_id),
    CONSTRAINT fk_committee_secretariats_committee FOREIGN KEY (committee_id) REFERENCES committees(id) ON DELETE CASCADE,
    CONSTRAINT fk_committee_secretariats_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_committee_secretariats_assigned_by FOREIGN KEY (assigned_by) REFERENCES users(id) ON DELETE SET NULL
);

INSERT INTO users (name, email, password_hash, role)
SELECT 'Division Chief', 'chief@example.com', '$2y$10$vmyX5Wo63HwMpU33O2653uZm0dy4fQrainq4l4vif5HK59QvinrmK', 'division_chief'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'chief@example.com');

INSERT INTO users (name, email, password_hash, role)
SELECT 'Committee Secretariat', 'secretariat@example.com', '$2y$10$vmyX5Wo63HwMpU33O2653uZm0dy4fQrainq4l4vif5HK59QvinrmK', 'secretariat'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'secretariat@example.com');
