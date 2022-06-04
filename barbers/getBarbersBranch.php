<?php
include "header.php";

$mysqli = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_database);
if ($mysqli->connect_errno) {
    echo '[]';
    http_response_code(400);
    return;
}
$mysqli->set_charset("utf8");

$branch_id = $_GET['branch_id'];

if (isset($branch_id)) {
    $res = $mysqli->query(
        "SELECT barbers.id, position, name, rating, image, barbers.branch_id FROM barbers LEFT JOIN positions ON barbers.position_id = positions.id WHERE branch_id =" . $branch_id);
    $res->data_seek(0);
    $rows = array();
    while ($row = $res->fetch_assoc()){
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
