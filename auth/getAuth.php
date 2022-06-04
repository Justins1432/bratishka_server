<?php
include "header.php";
$mysqli = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_database);
if ($mysqli->connect_errno) {
    echo '[]';
    http_response_code(400);
    return;
}
$mysqli->set_charset("utf8");

$email = $_GET['email'];
$password = $_GET['password'];

if (isset($email) && isset($password)) {
    $res = $mysqli->query("SELECT users.id, email, password FROM users WHERE email = '$email' AND password = '$password'");
    $res->data_seek(0);
    $rows = array();
    while ($row = $res->fetch_assoc()) {
        $rows[] = $row;
    }
    if (count($rows) > 0) {
        echo '{ "status": "OK", "message": "Добро пожаловать!" }';
    } else {
        echo '{ "status": "error", "message": "Неправильный логин или пароль!" }';
    }
} else {
    echo '{ "status": "error", "message": "Failed to search record" }';
    http_response_code(400);
}
