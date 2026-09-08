<?php

require_once __DIR__ . '/../app/auth.php';

if (current_user()) {
    audit_log('logout', 'User signed out.', 'user', current_user()['id']);
}
session_destroy();
redirect('/login.php');
