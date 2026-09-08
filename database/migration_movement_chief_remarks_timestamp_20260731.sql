ALTER TABLE record_movements
ADD COLUMN chief_remarks_updated_at DATETIME NULL AFTER chief_remarks;

UPDATE record_movements
SET chief_remarks_updated_at = created_at
WHERE COALESCE(NULLIF(chief_remarks, ''), '') <> ''
AND chief_remarks_updated_at IS NULL;
