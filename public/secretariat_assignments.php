<?php

require_once __DIR__ . '/../app/auth.php';
require_login();

if (!can_manage_assignments()) {
    http_response_code(403);
    exit('This page is for the City Secretary and Division Chief.');
}

try {
    db()->query('SELECT 1 FROM committee_secretariats LIMIT 1');
} catch (Throwable $error) {
    require __DIR__ . '/../app/partials/header.php';
    ?>
    <section class="panel">
        <h1>Secretariat Assignments</h1>
        <p class="muted">Import <strong>database/migration_roles_assignments.sql</strong> in phpMyAdmin to enable committee assignments.</p>
    </section>
    <?php
    require __DIR__ . '/../app/partials/footer.php';
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    verify_csrf();
    $committeeId = (int) ($_POST['committee_id'] ?? 0);
    if (!can_access_committee($committeeId)) {
        http_response_code(403);
        exit('You can only assign Secretariat users to committees assigned to you.');
    }

    $selectedUsers = array_map('intval', $_POST['secretariat_ids'] ?? []);

    $pdo = db();
    $pdo->beginTransaction();
    try {
        $delete = $pdo->prepare('DELETE FROM committee_secretariats WHERE committee_id = ?');
        $delete->execute([$committeeId]);

        $insert = $pdo->prepare('INSERT INTO committee_secretariats (committee_id, user_id, assigned_by) VALUES (?, ?, ?)');
        foreach ($selectedUsers as $userId) {
            $insert->execute([$committeeId, $userId, current_user()['id']]);
        }

        $pdo->commit();
        audit_log('secretariat_assignment_update', 'Updated Secretariat assignments for committee #' . $committeeId . '.', 'committee', $committeeId);
        flash('Secretariat assignment saved.');
    } catch (Throwable $error) {
        $pdo->rollBack();
        flash('Unable to save assignment. Please try again.', 'error');
    }

    redirect('/secretariat_assignments.php');
}

if ((current_user()['role'] ?? '') === 'division_chief') {
    $chiefCommitteeIds = division_chief_committee_ids();
    if ($chiefCommitteeIds) {
        $placeholders = implode(',', array_fill(0, count($chiefCommitteeIds), '?'));
        $stmt = db()->prepare("SELECT id, name FROM committees WHERE id IN ($placeholders) ORDER BY name");
        $stmt->execute($chiefCommitteeIds);
        $committees = $stmt->fetchAll();
    } else {
        $committees = [];
    }
} else {
    $committees = db()->query('SELECT id, name FROM committees ORDER BY name')->fetchAll();
}
if ((current_user()['role'] ?? '') === 'division_chief') {
    $chiefSecretariatIds = division_chief_secretariat_ids();
    if ($chiefSecretariatIds) {
        $placeholders = implode(',', array_fill(0, count($chiefSecretariatIds), '?'));
        $secretariatStmt = db()->prepare("SELECT id, name, email FROM users WHERE role = 'secretariat' AND is_active = 1 AND id IN ($placeholders) ORDER BY name");
        $secretariatStmt->execute($chiefSecretariatIds);
        $secretariats = $secretariatStmt->fetchAll();
    } else {
        $secretariats = [];
    }
} else {
    $secretariats = db()->query("SELECT id, name, email FROM users WHERE role = 'secretariat' AND is_active = 1 ORDER BY name")->fetchAll();
}
$assignments = db()->query('SELECT committee_id, user_id FROM committee_secretariats')->fetchAll();
$assignedMap = [];
foreach ($assignments as $assignment) {
    $assignedMap[(int) $assignment['committee_id']][] = (int) $assignment['user_id'];
}

require __DIR__ . '/../app/partials/header.php';
?>
<div class="page-head">
    <div>
        <h1>Secretariat Assignments</h1>
        <p class="muted">Assign which Secretariat users can edit records for each committee.</p>
    </div>
</div>

<?php foreach ($committees as $committee): ?>
    <section class="panel" style="margin-bottom:16px;">
        <h2><?= e($committee['name']) ?></h2>
        <form method="post" class="grid">
            <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>">
            <input type="hidden" name="committee_id" value="<?= (int) $committee['id'] ?>">
            <div class="assignment-grid">
                <?php foreach ($secretariats as $secretariat): ?>
                    <label class="check-row">
                        <span>
                            <input type="checkbox" name="secretariat_ids[]" value="<?= (int) $secretariat['id'] ?>" <?= in_array((int) $secretariat['id'], $assignedMap[(int) $committee['id']] ?? [], true) ? 'checked' : '' ?>>
                            <?= e($secretariat['name']) ?>
                        </span>
                        <span class="muted"><?= e($secretariat['email']) ?></span>
                    </label>
                <?php endforeach; ?>
                <?php if (!$secretariats): ?><p class="muted">No active Secretariat users yet.</p><?php endif; ?>
            </div>
            <div class="actions">
                <button class="btn" type="submit">Save Assignment</button>
            </div>
        </form>
    </section>
<?php endforeach; ?>
<?php require __DIR__ . '/../app/partials/footer.php'; ?>
