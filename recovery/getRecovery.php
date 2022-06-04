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
$code = $_GET['code'];
$password = $_GET['password'];

if (isset($email) && isset($code) && isset($password)){
    $res = $mysqli->query("SELECT email, code FROM users_code WHERE email = '$email' AND code = $code");
    $res->data_seek(0);
    $rows = array();
    while ($row = $res->fetch_assoc()) {
        $rows[] = $row;
    }

    if (count($rows) > 0){
        mysqli_query($mysqli, "UPDATE users SET `password` = '$password' WHERE users.email = '$email'");
        echo '{ "status": "ОК", "message": "Пароль успешно изменен!" }';
    } else {
        echo '{ "status": "error", "message": "Failed to search record" }';
        http_response_code(400);
    }

} else {
    echo '{ "status": "error", "message": "Not Found!" }';
    http_response_code(400);
}