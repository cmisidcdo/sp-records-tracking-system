USE lcd_records;

CREATE TABLE IF NOT EXISTS committee_terms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    start_year YEAR NOT NULL,
    end_year YEAR NOT NULL,
    is_current TINYINT(1) NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS committee_members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    committee_id INT NOT NULL,
    term_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    position ENUM('Chairperson', 'Vice Chairperson', 'Member') NOT NULL DEFAULT 'Member',
    sort_order INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_committee_members_committee FOREIGN KEY (committee_id) REFERENCES committees(id) ON DELETE CASCADE,
    CONSTRAINT fk_committee_members_term FOREIGN KEY (term_id) REFERENCES committee_terms(id) ON DELETE CASCADE
);

INSERT INTO committee_terms (name, start_year, end_year, is_current)
SELECT '2026-2029 Term', 2026, 2029, 1
WHERE NOT EXISTS (SELECT 1 FROM committee_terms);

INSERT INTO committee_members (committee_id, term_id, name, position, sort_order)
SELECT c.id, t.id, COALESCE(NULLIF(c.chairperson, ''), 'Committee Chair'), 'Chairperson', 1
FROM committees c
CROSS JOIN (SELECT id FROM committee_terms WHERE is_current = 1 ORDER BY id DESC LIMIT 1) t
WHERE NOT EXISTS (
    SELECT 1 FROM committee_members m
    WHERE m.committee_id = c.id AND m.term_id = t.id AND m.position = 'Chairperson'
);
