<?php

error_reporting(0);

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
$servername = "varsopc.varsonet.intra"; 
$username = "gnyr_acc"; 
$password = "b5g3BFId[j@u5trv";
$dbname = "gnyr";

$conn = mysqli_connect($servername, $username, $password, $dbname);
if (!$conn) {
  $hiba = [
    "success" => FALSE,
    "result" => "Belső hiba",
    "message" => mysqli_connect_error(),
  ];
  die(json_encode($hiba, JSON_UNESCAPED_UNICODE));
}
?>