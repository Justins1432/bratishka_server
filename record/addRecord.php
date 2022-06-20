<?php
include "header.php";
$mysqli = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_database);
if ($mysqli->connect_errno) {
    echo '[]';
    http_response_code(400);
    return;
}
$mysqli->set_charset("utf8");

$date = $_GET['date_record'];
$email = $_GET['user_email'];
$branchID = $_GET['branch_id'];
$h_name = $_GET['h_name'];
$h_price = $_GET['h_price'];
$schedule = $_GET['schedule'];
$barberID = $_GET['barber_id'];
//$promocode = $_GET['promocode'];

if (isset($date) && isset($email) && isset($branchID) && isset($h_name) && isset($h_price) && isset($schedule) && isset($barberID)) {
    $res = $mysqli->query("INSERT INTO record (date_record, user_email, branch_id, h_name, h_price, schedule, barber_id) VALUES ('$date', '$email', 
                                                                                                      '$branchID', '$h_name', '$h_price', '$schedule', '$barberID')");
    $id_record = mysqli_insert_id($mysqli);
    echo '{"status": "success", "id":' . $id_record . '}';
    http_response_code(200);

    /*if ($promocode == "") {
    } else {
        $res = $mysqli->query("INSERT INTO record (date_record, user_email, branch_id, h_name, h_price, schedule, barber_id, promocode) 
                                 VALUES ('$date', '$email', '$branchID', '$h_name', '$h_price', '$schedule', '$barberID', '$promocode')");
        $id_record = mysqli_insert_id($mysqli);
        echo '{"status": "success", "id":' . $id_record . '}';
        http_response_code(200);
    }*/
} else {
    echo '{ "status": "error", "message" : "Failed to search record" }';
    http_response_code(400);
}