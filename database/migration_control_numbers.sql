USE lcd_records;

UPDATE records
SET control_number = CONCAT('L-', LPAD(id, 5, '0'), '-', YEAR(COALESCE(received_date, created_at)))
WHERE document_type = 'Committee Referrals'
AND control_number NOT REGEXP '^L-[0-9]{5}-[0-9]{4}$';

UPDATE records
SET control_number = CONCAT('A-', LPAD(id, 5, '0'), '-', YEAR(COALESCE(received_date, created_at)))
WHERE document_type = 'Transmittals, Letters and Endorsements'
AND control_number NOT REGEXP '^A-[0-9]{5}-[0-9]{4}$';
