USE lcd_records;

ALTER TABLE records
ADD COLUMN client_name VARCHAR(180) NULL AFTER origin,
ADD COLUMN receiving_clerk_id INT NULL AFTER assigned_user_id;

ALTER TABLE records
ADD CONSTRAINT fk_records_receiving_clerk FOREIGN KEY (receiving_clerk_id) REFERENCES users(id) ON DELETE SET NULL;

UPDATE records
SET document_type = 'Committee Referrals'
WHERE document_type IN ('Committee Referral', 'Committee Referrals', 'Committee Referral');

UPDATE records
SET document_type = 'Transmittals, Letters and Endorsements'
WHERE document_type NOT IN ('Committee Referrals', 'Transmittals, Letters and Endorsements');

UPDATE records
SET receiving_clerk_id = created_by
WHERE receiving_clerk_id IS NULL
AND created_by IN (SELECT id FROM users WHERE role = 'receiving_clerk');
