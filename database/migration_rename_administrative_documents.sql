USE lcd_records;

UPDATE records
SET document_type = 'Transmittals, Letters and Endorsements'
WHERE document_type = 'Administrative Documents';
