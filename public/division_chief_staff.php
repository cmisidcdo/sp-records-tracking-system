<?php

require_once __DIR__ . '/../app/auth.php';
require_login();

if (!can_manage_division_chief_assignments()) {
    http_response_code(403);
    exit('Only the Administrator and City Secretary can assign staff under Division Chiefs.');
}

try {
    db()->query('SELECT 1 FROM division_chief_secretariats LIMIT 1');
} catch (Throwable $error) {
    require __DIR__ . '/../app/partials/header.php';
    ?>
    <section class="panel">
        <h1>Division Staff Assignment</h1>
        <p class="muted">Import <strong>database/migration_division_chief_secretariats.sql</strong> in phpMyAdmin to enable staff assignments.</p>
    </section>
    <?php
    require __DIR__ . '/../app/partials/footer.php';
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    verify_csrf();
    $divisionChiefId = (int) ($_POST['division_chief_id'] ?? 0);
    $selectedStaff = array_map('intval', $_POST['staff_ids'] ?? []);

    $pdo = db();
    $pdo->beginTransaction();
    try {
        $delete = $pdo->prepare('DELETE FROM division_chief_secretariats WHERE division_chief_user_id = ?');
        $delete->execute([$divisionChiefId]);

        $insert = $pdo->prepare('INSERT INTO division_chief_secretariats (division_chief_user_id, secretariat_user_id, assigned_by) VALUES (?, ?, ?)');
        foreach ($selectedStaff as $staffId) {
            $insert->execute([$divisionChiefId, $staffId, current_user()['id']]);
        }

        $pdo->commit();
        audit_log('division_chief_staff_assignment_update', 'Updated staff under Division Chief #' . $divisionChiefId . '.', 'user', $divisionChiefId);
        flash('Division Chief staff assignment saved.');
    } catch (Throwable $error) {
        $pdo->rollBack();
        flash('Unable to save Division Chief staff assignment. Please try again.', 'error');
    }

    redirect('/division_chief_staff.php');
}

$divisionChiefs = db()->query("SELECT id, name, division_name, email, COALESCE(NULLIF(division_name, ''), name) display_name FROM users WHERE role = 'division_chief' AND is_active = 1 ORDER BY display_name")->fetchAll();
$staffUsers = db()->query("SELECT id, name, email, role FROM users WHERE role IN ('secretariat', 'division_staff') AND is_active = 1 ORDER BY role, name")->fetchAll();
$assignments = db()->query('SELECT division_chief_user_id, secretariat_user_id FROM division_chief_secretariats')->fetchAll();
$assignedMap = [];
foreach ($assignments as $assignment) {
    $assignedMap[(int) $assignment['division_chief_user_id']][] = (int) $assignment['secretariat_user_id'];
}

require __DIR__ . '/../app/partials/header.php';
?>
<div class="page-head">
    <div>
        <h1>Division Staff Assignment</h1>
        <p class="muted">Assign Secretariat and Division Staff accounts under each Division Chief.</p>
    </div>
</div>

<?php foreach ($divisionChiefs as $chief): ?>
    <section class="panel" style="margin-bottom:16px;">
        <h2><?= e($chief['display_name']) ?></h2>
        <p class="muted"><?= e($chief['name']) ?> - <?= e($chief['email']) ?></p>
        <form method="post" class="grid">
            <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>">
            <input type="hidden" name="division_chief_id" value="<?= (int) $chief['id'] ?>">
            <div class="assignment-grid">
                <?php foreach ($staffUsers as $staff): ?>
                    <label class="check-row">
                        <span>
                            <input type="checkbox" name="staff_ids[]" value="<?= (int) $staff['id'] ?>" <?= in_array((int) $staff['id'], $assignedMap[(int) $chief['id']] ?? [], true) ? 'checked' : '' ?>>
                            <?= e($staff['name']) ?>
                            <span class="badge"><?= e(role_label($staff['role'])) ?></span>
                        </span>
                        <span class="muted"><?= e($staff['email']) ?></span>
                    </label>
                <?php endforeach; ?>
                <?php if (!$staffUsers): ?><p class="muted">No active Secretariat or Division Staff users yet.</p><?php endif; ?>
            </div>
            <div class="actions">
                <button class="btn" type="submit">Save Staff Assignment</button>
            </div>
        </form>
    </section>
<?php endforeach; ?>

<?php if (!$divisionChiefs): ?>
    <section class="panel"><p class="muted">No active Division Chief users yet.</p></section>
<?php endif; ?>
<?php require __DIR__ . '/../app/partials/footer.php'; ?>
