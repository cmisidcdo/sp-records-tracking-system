<?php

require_once __DIR__ . '/../app/auth.php';

header('Content-Type: application/json; charset=UTF-8');
if (!current_user()) {
    http_response_code(401);
    echo json_encode(['records' => [], 'error' => 'Authentication required.']);
    exit;
}

$query = trim((string) ($_GET['q'] ?? ''));
try {
    echo json_encode(
        ['records' => personal_note_record_suggestions($query, 10)],
        JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
    );
} catch (Throwable $error) {
    error_log('Unable to search personal-note records: ' . $error->getMessage());
    http_response_code(500);
    echo json_encode(['records' => [], 'error' => 'Unable to search records right now.']);
}
