<?php
include "header.php";
$mysqli = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_database);
if ($mysqli->connect_errno) {
    echo '[]';
    http_response_code(400);
    return;
}
$mysqli->set_charset("utf8");

$id = $_GET['id'];
$day = $_GET['day'];
if(isset($id) && isset($day)){
    $res = $mysqli->query("SELECT id, ".$day."_start, ".$day."_end FROM barber_schedule WHERE id = ". $id);
    $res->data_seek(0);
    $rows = array();
    while ($row = $res->fetch_assoc()) {
        $rows[] = $row;
    }

    if (count($rows) > 0){
        print json_encode($rows, JSON_UNESCAPED_UNICODE);
    } else {
        echo '[]';
    }
}
else if (isset($id)){
    $res = $mysqli->query("SELECT * FROM barber_schedule WHERE id = $id");

    $res->data_seek(0);
    $rows = array();
    while ($row = $res->fetch_assoc()) {
        $rows[] = $row;
    }

    if (count($rows) > 0){
        print json_encode($rows, JSON_UNESCAPED_UNICODE);
    } else {
        echo '[]';
    }

}
else {
    echo '{ "status" : "OK", "message" : "Not Found"}';
    http_response_code(400);
}