START TRANSACTION;

INSERT INTO lcd_records.records
(id,control_number,title,document_type,origin,client_name,contact_number,client_email,committee_id,assigned_user_id,receiving_clerk_id,priority,status,received_date,due_date,current_location,remarks,proposed_ordinance_number,proposed_resolution_number,approved_ordinance_number,approved_resolution_number,plenary_session_date,plenary_approved_date,created_by,updated_by,created_at,updated_at)
SELECT s.id,
       CASE s.id WHEN 66 THEN 'A-00027-2026' WHEN 70 THEN 'A-00028-2026' ELSE s.control_number END,
       s.title,s.document_type,s.origin,s.client_name,s.contact_number,s.client_email,s.committee_id,s.assigned_user_id,s.receiving_clerk_id,s.priority,s.status,s.received_date,s.due_date,s.current_location,
       CASE s.id
         WHEN 66 THEN CONCAT_WS('\r\n\r\n',NULLIF(s.remarks,''),'Recovery note: restored from the August 17, 2026 5:13 PM runtime. Original control number A-00020-2026 conflicted with an existing live record; reassigned to A-00027-2026.')
         WHEN 70 THEN CONCAT_WS('\r\n\r\n',NULLIF(s.remarks,''),'Recovery note: restored from the August 17, 2026 5:13 PM runtime. Original control number A-00019-2026 conflicted with an existing live record; reassigned to A-00028-2026.')
         ELSE s.remarks
       END,
       s.proposed_ordinance_number,s.proposed_resolution_number,s.approved_ordinance_number,s.approved_resolution_number,s.plenary_session_date,s.plenary_approved_date,s.created_by,s.updated_by,s.created_at,s.updated_at
FROM recovery_aug17_1713.records s
WHERE s.id BETWEEN 62 AND 72
  AND NOT EXISTS (SELECT 1 FROM lcd_records.records l WHERE l.id=s.id)
  AND NOT EXISTS (SELECT 1 FROM lcd_records.records l WHERE l.control_number=CASE s.id WHEN 66 THEN 'A-00027-2026' WHEN 70 THEN 'A-00028-2026' ELSE s.control_number END);
SELECT 'records_inserted' item,ROW_COUNT() inserted;

INSERT INTO lcd_records.record_attachments
(record_id,original_name,stored_name,mime_type,file_size,uploaded_by,created_at)
SELECT s.record_id,s.original_name,s.stored_name,s.mime_type,s.file_size,s.uploaded_by,s.created_at
FROM recovery_aug17_1713.record_attachments s
JOIN lcd_records.records r ON r.id=s.record_id
WHERE s.record_id BETWEEN 62 AND 72
  AND NOT EXISTS (SELECT 1 FROM lcd_records.record_attachments l WHERE l.record_id=s.record_id AND l.stored_name=s.stored_name);
SELECT 'attachments_inserted' item,ROW_COUNT() inserted;

INSERT INTO lcd_records.record_committees
(record_id,committee_id,sequence_no,created_at)
SELECT s.record_id,s.committee_id,s.sequence_no,s.created_at
FROM recovery_aug17_1713.record_committees s
JOIN lcd_records.records r ON r.id=s.record_id
WHERE s.record_id BETWEEN 62 AND 72
  AND NOT EXISTS (SELECT 1 FROM lcd_records.record_committees l WHERE l.record_id=s.record_id AND l.committee_id=s.committee_id AND l.sequence_no=s.sequence_no);
SELECT 'committee_links_inserted' item,ROW_COUNT() inserted;

INSERT INTO lcd_records.record_movements
(record_id,from_status,to_status,from_location,to_location,notes,report_title,report_remarks,chief_remarks,chief_remarks_updated_at,updated_by,created_at)
SELECT s.record_id,s.from_status,s.to_status,s.from_location,s.to_location,s.notes,s.report_title,s.report_remarks,s.chief_remarks,s.chief_remarks_updated_at,s.updated_by,s.created_at
FROM recovery_aug17_1713.record_movements s
JOIN lcd_records.records r ON r.id=s.record_id
WHERE s.record_id BETWEEN 62 AND 72
  AND NOT EXISTS (SELECT 1 FROM lcd_records.record_movements l WHERE l.record_id=s.record_id AND l.created_at=s.created_at AND l.to_status<=>s.to_status AND l.notes<=>s.notes);
SELECT 'movements_inserted' item,ROW_COUNT() inserted;

INSERT INTO lcd_records.committee_report_numbers
(record_id,committee_id,report_year,sequence_no,created_at)
SELECT s.record_id,s.committee_id,s.report_year,s.sequence_no,s.created_at
FROM recovery_aug17_1713.committee_report_numbers s
JOIN lcd_records.records r ON r.id=s.record_id
WHERE s.record_id BETWEEN 62 AND 72
  AND NOT EXISTS (SELECT 1 FROM lcd_records.committee_report_numbers l WHERE l.committee_id=s.committee_id AND l.report_year=s.report_year AND l.sequence_no=s.sequence_no);
SELECT 'report_numbers_inserted' item,ROW_COUNT() inserted;

INSERT INTO lcd_records.audit_logs
(user_id,action,entity_type,entity_id,description,ip_address,user_agent,created_at)
SELECT s.user_id,s.action,s.entity_type,s.entity_id,s.description,s.ip_address,s.user_agent,s.created_at
FROM recovery_aug17_1713.audit_logs s
JOIN lcd_records.records r ON r.id=s.entity_id
WHERE s.entity_type='record' AND s.entity_id BETWEEN 62 AND 72
  AND NOT EXISTS (SELECT 1 FROM lcd_records.audit_logs l WHERE l.action=s.action AND l.entity_type=s.entity_type AND l.entity_id=s.entity_id AND l.description=s.description AND l.created_at=s.created_at);
SELECT 'source_audit_entries_inserted' item,ROW_COUNT() inserted;

INSERT INTO lcd_records.audit_logs
(user_id,action,entity_type,entity_id,description,ip_address,user_agent,created_at)
VALUES
(NULL,'record_recovery','record',66,'Recovered record from August 17, 2026 runtime. Original control number A-00020-2026 was reassigned to A-00027-2026 because A-00020-2026 is occupied in the live database.','127.0.0.1','Local database recovery',NOW()),
(NULL,'record_recovery','record',70,'Recovered record from August 17, 2026 runtime. Original control number A-00019-2026 was reassigned to A-00028-2026 because A-00019-2026 is occupied in the live database.','127.0.0.1','Local database recovery',NOW());
SELECT 'recovery_audit_entries_inserted' item,ROW_COUNT() inserted;

COMMIT;