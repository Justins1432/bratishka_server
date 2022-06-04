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
$code_registration = '';
$message = "Код регистрации";

if (isset($email)) {
    $code_registration = rand(1000, 9999);
    mail($email, $message, $code_registration);
    mysqli_query($mysqli, "delete from users_code where email = '$email'");
    $res = $mysqli->query("insert into users_code (email, code) values ('$email', $code_registration)");
    echo '{ "status": "ОК", "message": "Код отправлен!" }';
} else {
    echo '{ "status": "error", "message": "Failed to search record" }';
    http_response_code(400);
}