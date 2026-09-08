UPDATE records
SET current_location = REPLACE(current_location, 'Receiving Section Staff', 'Admin Receiving Section')
WHERE current_location LIKE '%Receiving Section Staff%';

UPDATE records
SET remarks = REPLACE(remarks, 'Receiving Section Staff', 'Admin Receiving Section')
WHERE remarks LIKE '%Receiving Section Staff%';

UPDATE record_movements
SET from_location = REPLACE(from_location, 'Receiving Section Staff', 'Admin Receiving Section')
WHERE from_location LIKE '%Receiving Section Staff%';

UPDATE record_movements
SET to_location = REPLACE(to_location, 'Receiving Section Staff', 'Admin Receiving Section')
WHERE to_location LIKE '%Receiving Section Staff%';

UPDATE record_movements
SET notes = REPLACE(notes, 'Receiving Section Staff', 'Admin Receiving Section')
WHERE notes LIKE '%Receiving Section Staff%';

UPDATE audit_logs
SET description = REPLACE(description, 'Receiving Section Staff', 'Admin Receiving Section')
WHERE description LIKE '%Receiving Section Staff%';
