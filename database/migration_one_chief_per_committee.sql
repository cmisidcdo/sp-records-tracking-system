USE lcd_records;

DELETE a
FROM committee_division_chiefs a
INNER JOIN committee_division_chiefs b
    ON a.committee_id = b.committee_id
    AND a.id > b.id;

ALTER TABLE committee_division_chiefs
ADD UNIQUE KEY uq_committee_one_division_chief (committee_id);
