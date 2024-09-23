<?php
//$connectionString = "server=127.0.0.1;port=3306;user=root;password=;dbname=php";
$connectionString = getenv('ConnectionStrings__DefaultConnection');

try {
    $pdo = new PDO("mysql:$connectionString");
    //echo "Connected successfully";

} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>
