<?php

require_once __DIR__ . '/../app/auth.php';
require_login();
ensure_plenary_number_schema();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    redirect('/records.php?tab=committee');
}

verify_csrf();

$recordId = (int) ($_POST['record_id'] ?? 0);
$returnPath = (string) ($_POST['return_path'] ?? '/records.php?tab=committee');
if (!preg_match('#^/(?:records|dashboard|record_view)\.php(?:\?[A-Za-z0-9_=&%+.-]*)?$#D', $returnPath)) {
    $returnPath = '/records.php?tab=committee';
}

$stmt = db()->prepare('SELECT * FROM records WHERE id = ? LIMIT 1');
$stmt->execute([$recordId]);
$record = $stmt->fetch();

if (!$record) {
    http_response_code(404);
    exit('Record not found.');
}

if (!can_attest_division_receipt($record)) {
    http_response_code(403);
    exit('Only Division Staff assigned to this record division can attest physical receipt.');
}

$divisionName = user_division_name();
$receivedAt = date('Y-m-d H:i:s');
$userId = (int) (current_user()['id'] ?? 0);
$pdo = db();

try {
    $pdo->beginTransaction();

    $receiptStmt = $pdo->prepare('INSERT IGNORE INTO record_division_receipts (record_id, division_name, received_by, received_at) VALUES (?, ?, ?, ?)');
    $receiptStmt->execute([$recordId, $divisionName, $userId, $receivedAt]);

    if ($receiptStmt->rowCount() === 0) {
        $pdo->rollBack();
        $existing = division_receipts_for_records([$recordId], $divisionName)[$recordId] ?? null;
        $message = 'The physical copy was already marked received by this division.';
        if ($existing && !empty($existing['received_at'])) {
            $message .= ' Received ' . display_datetime($existing['received_at']) . '.';
        }
        flash($message, 'error');
        redirect($returnPath);
    }

    $pdo->commit();
    audit_log(
        'division_physical_copy_received',
        'Attested receipt of the physical record attachments for ' . $divisionName . ' on ' . display_datetime($receivedAt) . '.',
        'record',
        $recordId
    );
    flash('Physical copy marked received on ' . display_datetime($receivedAt) . '.');
} catch (Throwable $error) {
    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    flash('Unable to record the physical-copy receipt. Please try again.', 'error');
}

redirect($returnPath);
