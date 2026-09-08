ALTER TABLE records
ADD COLUMN plenary_session_date DATE NULL AFTER approved_resolution_number;

UPDATE records r
SET r.plenary_session_date = (
    SELECT STR_TO_DATE(
        SUBSTRING(REGEXP_SUBSTR(m.notes, 'Date: [0-9]{4}-[0-9]{2}-[0-9]{2}'), 7),
        '%Y-%m-%d'
    )
    FROM record_movements m
    WHERE m.record_id = r.id
      AND m.to_status = 'For Plenary Session'
      AND m.notes REGEXP 'Date: [0-9]{4}-[0-9]{2}-[0-9]{2}'
    ORDER BY m.created_at DESC, m.id DESC
    LIMIT 1
)
WHERE r.plenary_session_date IS NULL
  AND EXISTS (
      SELECT 1
      FROM record_movements m_existing
      WHERE m_existing.record_id = r.id
        AND m_existing.to_status = 'For Plenary Session'
        AND m_existing.notes REGEXP 'Date: [0-9]{4}-[0-9]{2}-[0-9]{2}'
  );
