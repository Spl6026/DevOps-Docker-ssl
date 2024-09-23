<?php
require_once('conn.php');

if (empty($_GET['id'])) {
    die('請輸入 id');
}
$id = $_GET['id'];

$sql = "DELETE FROM users WHERE id = $id";

$sth = $pdo->prepare($sql);
try {
    if ($sth->execute()) {
        //echo '刪除成功';
    } else {
        echo '刪除失敗';
    }
} catch (PDOException $e) {
    echo '刪除失敗';
}

header('Location: list.php');
?>
