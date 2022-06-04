<?php
include "header.php";
$mysqli = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_database);
if ($mysqli->connect_errno) {
    echo '[]';
    http_response_code(400);
    return;
}
$mysqli->set_charset("utf8");

$street = $_GET['street'];

if (isset($street)) {
    $res = $mysqli->query(
        "SELECT branches.id, street, city_id, latitude, longitude, number_phone, working_mode FROM branches WHERE street = '$street'");
    $rows = array();
    while ($row = $res->fetch_assoc()) {
        $rows[] = $row;
    }
    if (count($rows) > 0)
        print json_encode($rows, JSON_UNESCAPED_UNICODE);
    else
        echo '[]';
} else {
    echo '{ "status": "error", "message": "Failed to get record" }';
    http_response_code(400);
}