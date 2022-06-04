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

if (isset($email) && isset($code)) {
    $res = $mysqli->query("SELECT * FROM users_code WHERE email = '$email' AND code = '$code'");
    $res->data_seek(0);
    $rows = array();
    while ($row = $res->fetch_assoc()) {
        $rows[] = $row;
    }

    if (count($rows) > 0) {
        echo '{ "status": "OK", "message": "Код регистрации подтверждён" }';
    } else {
        echo '{ "status": "error", "message": "Код не совпадает" }';
    }

} else {
    echo '{ "status": "error", "message": "Failed to search record" }';
    http_response_code(400);
}