USE lcd_records;

ALTER TABLE users
MODIFY role ENUM('admin', 'city_secretary', 'division_chief', 'receiving_clerk', 'secretariat', 'division_staff', 'records_officer', 'staff') NOT NULL DEFAULT 'secretariat';

CREATE TABLE IF NOT EXISTS audit_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NULL,
    action VARCHAR(80) NOT NULL,
    entity_type VARCHAR(80) NULL,
    entity_id INT NULL,
    description TEXT NOT NULL,
    ip_address VARCHAR(45) NULL,
    user_agent VARCHAR(255) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_audit_logs_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

INSERT INTO users (name, email, password_hash, role)
SELECT 'Administrator', 'administrator@example.com', '$2y$10$vmyX5Wo63HwMpU33O2653uZm0dy4fQrainq4l4vif5HK59QvinrmK', 'admin'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'administrator@example.com');
