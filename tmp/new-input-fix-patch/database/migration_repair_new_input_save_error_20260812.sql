USE lcd_records;

START TRANSACTION;

INSERT INTO record_movements (
    record_id,
    to_status,
    to_location,
    notes,
    updated_by,
    created_at
)
SELECT
    r.id,
    r.status,
    r.current_location,
    'Record created. Movement restored after new-input save error.',
    r.created_by,
    r.created_at
FROM records r
WHERE r.id = 21
  AND r.control_number = 'A-00011-2026'
  AND NOT EXISTS (
      SELECT 1 FROM record_movements m WHERE m.record_id = r.id
  );

INSERT INTO audit_logs (
    user_id,
    action,
    entity_type,
    entity_id,
    description,
    ip_address,
    user_agent,
    created_at
)
SELECT
    r.created_by,
    'record_create',
    'record',
    r.id,
    'Created record A-00011-2026. Audit restored after new-input save error.',
    NULL,
    'Database new-input repair',
    r.created_at
FROM records r
WHERE r.id = 21
  AND r.control_number = 'A-00011-2026'
  AND NOT EXISTS (
      SELECT 1
      FROM audit_logs a
      WHERE a.entity_type = 'record'
        AND a.entity_id = r.id
        AND a.action = 'record_create'
  );

INSERT INTO audit_logs (
    user_id,
    action,
    entity_type,
    entity_id,
    description,
    ip_address,
    user_agent
)
VALUES
(NULL, 'duplicate_submission_cleanup', 'record', 22, 'Removed empty retry copy A-00012-2026 created by the new-input save error.', NULL, 'Database new-input repair'),
(NULL, 'duplicate_submission_cleanup', 'record', 23, 'Removed empty retry copy A-00013-2026 created by the new-input save error.', NULL, 'Database new-input repair'),
(NULL, 'duplicate_submission_cleanup', 'record', 24, 'Removed empty retry copy A-00014-2026 created by the new-input save error.', NULL, 'Database new-input repair');

DELETE FROM records
WHERE id IN (22, 23, 24)
  AND control_number IN ('A-00012-2026', 'A-00013-2026', 'A-00014-2026')
  AND created_by = 35
  AND title = 'REPLY TO THE LEGAL REVIEW ON THE PROPOSED MEMORANDUM OF AGREEMENT BETWEEN THE CITY GOVERNMENT OF CAGAYAN DE ORO AND FOOD TERMINAL INCORPORATED (FTI) RELATIVE TO THE IMPLEMENTATION OF THE PHP 20 RICE PROJECT/RICE-FOR-ALL PROGRAM'
  AND NOT EXISTS (SELECT 1 FROM record_movements m WHERE m.record_id = records.id)
  AND NOT EXISTS (SELECT 1 FROM record_attachments a WHERE a.record_id = records.id)
  AND NOT EXISTS (SELECT 1 FROM record_committees c WHERE c.record_id = records.id)
  AND NOT EXISTS (SELECT 1 FROM record_division_receipts d WHERE d.record_id = records.id)
  AND NOT EXISTS (SELECT 1 FROM record_recipients rr WHERE rr.record_id = records.id)
  AND NOT EXISTS (SELECT 1 FROM committee_report_numbers crn WHERE crn.record_id = records.id);

COMMIT;