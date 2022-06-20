<?php
include "header.php";
$mysqli = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_database);
if ($mysqli->connect_errno) {
    echo '[]';
    http_response_code(400);
    return;
}
$mysqli->set_charset("utf8");

$email = $_GET['user_email'];

if (isset($email)) {
    $res = $mysqli->query("SELECT record.id, date_record, user_email, h_name, h_price, schedule, b_name FROM record 
                                    LEFT JOIN barbers ON record.barber_id = barbers.id WHERE user_email ='$email'");
    $res->data_seek(0);
    $rows = array();
    while ($row = $res->fetch_assoc()) {
        $rows[] = $row;
    }
    if (count($rows) > 0)
        print json_encode($rows, JSON_UNESCAPED_UNICODE);
    else
        echo 'No data user';
} else {
    echo '{ "status": "error", "message" : "Failed to search record" }';
    http_response_code(400);
}