<?php
include "header.php";
$mysqli = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_database);
if ($mysqli->connect_errno) {
    echo '[]';
    http_response_code(400);
    return;
}

$mysqli->set_charset("utf8mb4");
$mysqli->options(MYSQLI_OPT_INT_AND_FLOAT_NATIVE, TRUE);


$res = $mysqli->query("select discounts.id, name_type, description, image from discounts left join type_discount on discounts.type_discount_id = type_discount.id");
$res->data_seek(0);
$rows = array();
while ($row = $res->fetch_assoc()){

    $rows[] = $row;

}
print json_encode($rows);

