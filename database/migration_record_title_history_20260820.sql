ALTER TABLE record_movements
ADD COLUMN IF NOT EXISTS record_title VARCHAR(1000) NULL AFTER report_title,
ADD COLUMN IF NOT EXISTS previous_title VARCHAR(1000) NULL AFTER record_title;

UPDATE record_movements m
JOIN records r ON r.id = m.record_id
SET m.record_title = COALESCE(NULLIF(TRIM(m.report_title), ''), r.title),
    m.previous_title = CASE
        WHEN NULLIF(TRIM(m.report_title), '') IS NOT NULL
            AND TRIM(m.report_title) <> TRIM(r.title)
        THEN r.title
        ELSE m.previous_title
    END
WHERE m.record_title IS NULL;
