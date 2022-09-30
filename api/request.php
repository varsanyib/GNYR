<?php

require('connection.php');

if (isset($_GET['frsz'])) {
    $frsz = str_replace(" ", "+", $_GET['frsz']);
}

$sql = "SELECT `frsz`,`autotipusok`.`gyarto`,`autotipusok`.`tipus`,`evjarat`,`szin`,`cre_time`,`mod_time`,`megjegyzes` FROM `autok` INNER JOIN `autotipusok` ON `autotipusok`.`id` = `autok`.`autotipus` WHERE `frsz` = '".$frsz."';";

$result = mysqli_query($conn, $sql);


$lekerdezett = [];
while ($row = mysqli_fetch_assoc($result)) {
    array_push($lekerdezett, $row);
};

if ($lekerdezett == [])
{
  $hiba = [
    "success" => FALSE,
    "result" => "Hiba!",
    "message" => "Hiba!",
  ];
  die(json_encode($hiba, JSON_UNESCAPED_UNICODE));
}
else {
  $lista = [
    "success" => TRUE,
    "result" => $lekerdezett,
  ];
  die(json_encode($lista, JSON_UNESCAPED_UNICODE));
}

mysqli_close($conn);

?>