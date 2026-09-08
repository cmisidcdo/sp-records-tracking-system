START TRANSACTION;
INSERT INTO lcd_records.records
SELECT s.* FROM recovery_cmp_before_delete.records s
WHERE s.id IN (58,60)
  AND NOT EXISTS (SELECT 1 FROM lcd_records.records l WHERE l.id=s.id OR l.control_number=s.control_number);
SELECT 'records_inserted' AS item, ROW_COUNT() AS inserted;

INSERT INTO lcd_records.record_attachments
(record_id,original_name,stored_name,mime_type,file_size,uploaded_by,created_at)
SELECT s.record_id,s.original_name,s.stored_name,s.mime_type,s.file_size,s.uploaded_by,s.created_at
FROM recovery_cmp_before_delete.record_attachments s
JOIN lcd_records.records r ON r.id=s.record_id
WHERE s.record_id IN (58,60)
  AND NOT EXISTS (SELECT 1 FROM lcd_records.record_attachments l WHERE l.record_id=s.record_id AND l.stored_name=s.stored_name);
SELECT 'attachments_inserted' AS item, ROW_COUNT() AS inserted;

INSERT INTO lcd_records.record_committees
(record_id,committee_id,sequence_no,created_at)
SELECT s.record_id,s.committee_id,s.sequence_no,s.created_at
FROM recovery_cmp_before_delete.record_committees s
JOIN lcd_records.records r ON r.id=s.record_id
WHERE s.record_id IN (58,60)
  AND NOT EXISTS (SELECT 1 FROM lcd_records.record_committees l WHERE l.record_id=s.record_id AND l.committee_id=s.committee_id AND l.sequence_no=s.sequence_no);
SELECT 'committee_links_inserted' AS item, ROW_COUNT() AS inserted;

INSERT INTO lcd_records.record_movements
(record_id,from_status,to_status,from_location,to_location,notes,report_title,report_remarks,chief_remarks,chief_remarks_updated_at,updated_by,created_at)
SELECT s.record_id,s.from_status,s.to_status,s.from_location,s.to_location,s.notes,s.report_title,s.report_remarks,s.chief_remarks,s.chief_remarks_updated_at,s.updated_by,s.created_at
FROM recovery_cmp_before_delete.record_movements s
JOIN lcd_records.records r ON r.id=s.record_id
WHERE s.record_id IN (58,60)
  AND NOT EXISTS (SELECT 1 FROM lcd_records.record_movements l WHERE l.record_id=s.record_id AND l.created_at=s.created_at AND l.to_status <=> s.to_status AND l.notes <=> s.notes);
SELECT 'movements_inserted' AS item, ROW_COUNT() AS inserted;

INSERT INTO lcd_records.audit_logs
(user_id,action,entity_type,entity_id,description,ip_address,user_agent,created_at)
SELECT s.user_id,s.action,s.entity_type,s.entity_id,s.description,s.ip_address,s.user_agent,s.created_at
FROM recovery_cmp_before_delete.audit_logs s
WHERE s.id IN (3458,3459,3462,3463)
  AND NOT EXISTS (SELECT 1 FROM lcd_records.audit_logs l WHERE l.action=s.action AND l.entity_type=s.entity_type AND l.entity_id=s.entity_id AND l.description=s.description AND l.created_at=s.created_at);
SELECT 'audit_entries_inserted' AS item, ROW_COUNT() AS inserted;

COMMIT;