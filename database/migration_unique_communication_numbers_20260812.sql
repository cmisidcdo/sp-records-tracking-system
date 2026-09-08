USE lcd_records;

START TRANSACTION;

UPDATE records SET control_number = 'A-00007-2026', updated_at = updated_at WHERE id = 8 AND control_number = 'A-00000-2026';
UPDATE records SET control_number = 'A-00008-2026', updated_at = updated_at WHERE id = 9 AND control_number = 'A-00001-2026';
UPDATE records SET control_number = 'A-00009-2026', updated_at = updated_at WHERE id = 10 AND control_number = 'A-00002-2026';
UPDATE records SET control_number = 'A-00010-2026', updated_at = updated_at WHERE id = 15 AND control_number = 'A-00004-2026';
UPDATE records SET control_number = 'L-00007-2026', updated_at = updated_at WHERE id = 14 AND control_number = 'L-00004-2026';
UPDATE records SET control_number = 'L-00008-2026', updated_at = updated_at WHERE id = 18 AND control_number = 'L-00006-2026';

INSERT INTO audit_logs (user_id, action, entity_type, entity_id, description, ip_address, user_agent)
VALUES
(NULL, 'communication_number_repair', 'record', 8, 'Renumbered duplicate Communication Number A-00000-2026 to A-00007-2026.', NULL, 'Database uniqueness repair'),
(NULL, 'communication_number_repair', 'record', 9, 'Renumbered duplicate Communication Number A-00001-2026 to A-00008-2026.', NULL, 'Database uniqueness repair'),
(NULL, 'communication_number_repair', 'record', 10, 'Renumbered duplicate Communication Number A-00002-2026 to A-00009-2026.', NULL, 'Database uniqueness repair'),
(NULL, 'communication_number_repair', 'record', 15, 'Renumbered duplicate Communication Number A-00004-2026 to A-00010-2026.', NULL, 'Database uniqueness repair'),
(NULL, 'communication_number_repair', 'record', 14, 'Renumbered duplicate Communication Number L-00004-2026 to L-00007-2026.', NULL, 'Database uniqueness repair'),
(NULL, 'communication_number_repair', 'record', 18, 'Renumbered duplicate Communication Number L-00006-2026 to L-00008-2026.', NULL, 'Database uniqueness repair');

COMMIT;

ALTER TABLE records
    DROP INDEX idx_records_control_number,
    ADD UNIQUE KEY uq_records_control_number (control_number);