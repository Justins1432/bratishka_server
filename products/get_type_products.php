<?php
include "header.php";

$mysqli = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_database);
if ($mysqli->connect_errno) {
    echo '[]';
    http_response_code(400);
    return;
}
$mysqli->set_charset("utf8");

$type_id = $_GET['type_id'];

if (isset($type_id)) {
    $res = $mysqli->query(
        "SELECT products.id, name, type, price, description, rating, image, icon FROM products LEFT JOIN types_product ON products.type_id = types_product.id WHERE products.type_id =". $type_id);

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