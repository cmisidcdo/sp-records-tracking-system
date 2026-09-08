USE `lcd_records`;

CREATE TABLE IF NOT EXISTS `system_identity` (
  `identity_id` TINYINT UNSIGNED NOT NULL,
  `instance_uuid` CHAR(36) NOT NULL,
  `instance_name` VARCHAR(120) NOT NULL,
  `authoritative_since` DATETIME NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`identity_id`),
  UNIQUE KEY `uq_system_identity_uuid` (`instance_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `system_identity`
  (`identity_id`, `instance_uuid`, `instance_name`, `authoritative_since`)
VALUES
  (1, 'a425b1c5-f742-4dc0-ac3e-084d62f6008e', 'SP Records authoritative database', '2026-08-18 11:00:00')
ON DUPLICATE KEY UPDATE
  `instance_uuid` = VALUES(`instance_uuid`),
  `instance_name` = VALUES(`instance_name`),
  `authoritative_since` = VALUES(`authoritative_since`);
