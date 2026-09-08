UPDATE records
SET current_location = REPLACE(current_location, 'Receiving Clerk', 'Receiving Section Staff')
WHERE current_location LIKE '%Receiving Clerk%';

UPDATE record_movements
SET from_location = REPLACE(from_location, 'Receiving Clerk', 'Receiving Section Staff')
WHERE from_location LIKE '%Receiving Clerk%';

UPDATE record_movements
SET to_location = REPLACE(to_location, 'Receiving Clerk', 'Receiving Section Staff')
WHERE to_location LIKE '%Receiving Clerk%';

UPDATE audit_logs
SET description = REPLACE(description, 'Receiving Clerk', 'Receiving Section Staff')
WHERE description LIKE '%Receiving Clerk%';
