<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="index.php">新增</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="list.php">列表</a>
                </li>
            </ul>
        </div>
    </nav>
    <div>
        <?php
        require_once('conn.php');

        try {
            $sql = "SELECT * FROM users";
            $pdo->query('SET NAMES utf8');
            if ($result = $pdo->query($sql)) {
                $total_records = $result->rowCount();
                echo "<p>" . "資料筆數: $total_records 筆" . "</p>";
                while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                    echo "<p>" . $row["account"] . "    " . '<a class="btn btn-primary" href="delete.php?id=' . $row['id'] . '">刪除</a>' . "</p>";
                }
            }
        } catch (PDOException $e) {
            echo '新增失敗';
        }
        $pdo = null;
        ?>
    </div>
</div>
</body>
</html>