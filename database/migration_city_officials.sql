USE lcd_records;

CREATE TABLE IF NOT EXISTS city_officials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    term_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    position ENUM('Vice Mayor', 'City Councilor', 'Presiding Officer', 'Presiding Officer Pro-Tempore', 'Majority Floor Leader', 'Assistant Majority Floor Leader', 'Minority Floor Leader', 'Assistant Minority Floor Leader') NOT NULL DEFAULT 'City Councilor',
    sort_order INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_city_officials_term FOREIGN KEY (term_id) REFERENCES committee_terms(id) ON DELETE CASCADE
);

INSERT INTO city_officials (term_id, name, position, sort_order)
SELECT t.id, 'Vice Mayor', 'Vice Mayor', 1
FROM committee_terms t
WHERE t.is_current = 1
AND NOT EXISTS (
    SELECT 1 FROM city_officials o
    WHERE o.term_id = t.id AND o.position = 'Vice Mayor'
);
