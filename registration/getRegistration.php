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
$phone_number = $_GET['number_phone'];

if (isset($email) && isset($password) && isset($phone_number)) {
    $res = $mysqli->query(
        "INSERT INTO users (email, password, number_phone) VALUES ('$email', '$password', '$phone_number')");
    $id_user = mysqli_insert_id($mysqli);
    echo '{ "status": "success", "id":'.$id_user.'}';
} else {
    echo '{ "status": "error", "message": "Failed to search record" }';
    http_response_code(400);
}
