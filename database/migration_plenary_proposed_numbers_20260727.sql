ALTER TABLE records
ADD COLUMN proposed_ordinance_number VARCHAR(80) NULL AFTER remarks,
ADD COLUMN proposed_resolution_number VARCHAR(80) NULL AFTER proposed_ordinance_number;
