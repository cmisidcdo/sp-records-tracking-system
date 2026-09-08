<?php

require_once __DIR__ . '/../app/auth.php';
require_login();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    redirect('/records.php');
}

verify_csrf();

$id = (int) ($_POST['record_id'] ?? 0);

$stmt = db()->prepare('SELECT * FROM records WHERE id = ?');
$stmt->execute([$id]);
$record = $stmt->fetch();

if (!$record) {
    flash('Record not found.', 'error');
    redirect('/records.php');
}

if (!can_delete_record($record)) {
    http_response_code(403);
    exit('You are not allowed to delete this record.');
}

try {
    $delete = db()->prepare('DELETE FROM records WHERE id = ?');
    $delete->execute([$id]);
    audit_log('record_delete', 'Deleted record ' . $record['control_number'] . ' - ' . $record['title'] . '.', 'record', $id);
    flash('Record deleted.');
} catch (Throwable $error) {
    flash('Unable to delete record. Please try again.', 'error');
}

redirect('/records.php');
