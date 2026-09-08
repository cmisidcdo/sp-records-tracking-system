<?php

require_once __DIR__ . '/../app/config.php';
require_once __DIR__ . '/../app/db.php';

$pdo = db();
$pdo->beginTransaction();

try {
    $duplicates = $pdo->query("
        SELECT control_number
        FROM records
        WHERE document_type = 'Committee Referrals'
        GROUP BY control_number
        HAVING COUNT(*) > 1
    ")->fetchAll(PDO::FETCH_COLUMN);

    foreach ($duplicates as $controlNumber) {
        $stmt = $pdo->prepare("SELECT * FROM records WHERE control_number = ? AND document_type = 'Committee Referrals' ORDER BY id");
        $stmt->execute([$controlNumber]);
        $records = $stmt->fetchAll();
        if (count($records) < 2) {
            continue;
        }

        $parent = $records[0];
        $parentId = (int) $parent['id'];
        $recordIds = array_map(fn ($record) => (int) $record['id'], $records);
        $childIds = array_slice($recordIds, 1);

        $committeeIds = [];
        foreach ($records as $record) {
            if (!empty($record['committee_id'])) {
                $committeeIds[] = (int) $record['committee_id'];
            }
        }

        $placeholders = implode(',', array_fill(0, count($recordIds), '?'));
        $committeeStmt = $pdo->prepare("SELECT committee_id FROM record_committees WHERE record_id IN ($placeholders) ORDER BY record_id, sequence_no");
        $committeeStmt->execute($recordIds);
        foreach ($committeeStmt->fetchAll(PDO::FETCH_COLUMN) as $committeeId) {
            $committeeIds[] = (int) $committeeId;
        }
        $committeeIds = array_values(array_unique(array_filter($committeeIds)));

        $latest = $records[0];
        foreach ($records as $record) {
            if (strtotime((string) $record['updated_at']) > strtotime((string) $latest['updated_at']) || ((string) $record['updated_at'] === (string) $latest['updated_at'] && (int) $record['id'] > (int) $latest['id'])) {
                $latest = $record;
            }
        }

        $remarksParts = [];
        foreach ($records as $record) {
            $remarks = trim((string) ($record['remarks'] ?? ''));
            if ($remarks !== '') {
                $remarksParts[] = 'From record #' . (int) $record['id'] . ":\n" . $remarks;
            }
        }
        $mergedRemarks = trim(implode("\n\n", array_unique($remarksParts)));

        if ($childIds) {
            $childPlaceholders = implode(',', array_fill(0, count($childIds), '?'));
            $move = $pdo->prepare("UPDATE record_movements SET record_id = ? WHERE record_id IN ($childPlaceholders)");
            $move->execute(array_merge([$parentId], $childIds));
        }

        $deleteCommittees = $pdo->prepare('DELETE FROM record_committees WHERE record_id = ?');
        $deleteCommittees->execute([$parentId]);
        $insertCommittee = $pdo->prepare('INSERT INTO record_committees (record_id, committee_id, sequence_no) VALUES (?, ?, ?)');
        foreach ($committeeIds as $index => $committeeId) {
            $insertCommittee->execute([$parentId, $committeeId, $index + 1]);
        }

        $update = $pdo->prepare('UPDATE records SET status = ?, remarks = ?, updated_by = ? WHERE id = ?');
        $update->execute([
            $latest['status'],
            $mergedRemarks !== '' ? $mergedRemarks : $parent['remarks'],
            $latest['updated_by'],
            $parentId,
        ]);

        if ($childIds) {
            $delete = $pdo->prepare("DELETE FROM records WHERE id IN ($childPlaceholders)");
            $delete->execute($childIds);
        }
    }

    $pdo->commit();
    echo 'Duplicate Communication Numbers consolidated.';
} catch (Throwable $error) {
    $pdo->rollBack();
    fwrite(STDERR, $error->getMessage());
    exit(1);
}

