<?php
require_once('conn.php');

$account = $_POST['account'];

$password = $_POST['password'];

$data = [$account, $password];

$sql = 'INSERT INTO users (account, password) VALUES (?, ?)';

$sth = $pdo->prepare($sql);

try {
    if ($sth->execute($data)) {
        //echo '新增成功';
    } else {
        echo '新增失敗';
    }
} catch (PDOException $e) {
    echo '新增失敗';
}

header("Location: index.php");
?>
