<?php

require('connection.php');

if (isset($_GET['frsz'])) {
    $frsz = str_replace(" ", "+", $_GET['frsz']);
}



echo '<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GNYR - Odometer infó</title>
    <link rel="stylesheet" href="../frontend/css/style.css">
</head>
<body>
    <div class="menustrip">
        <ul>
            <li class="menubrand">GNYR</li>
            <li class="menuitem clickable active"><a href="../frontend/index.html">Kezdőlap</a></li>
            <li class="menuitem clickable"><a href="../frontend/index.html#req">Lekérdezés</a></li>
        </ul>
    </div>
    <div id="res" class="content">
    <div class="title">
        <h1>'.$frsz.' forgalmi rendszámú gépjármű adatai</h1>
    </div>';



$sql = "SELECT * FROM `odometer` WHERE `auto_id` = '".$frsz."';";
$result = mysqli_query($conn, $sql);

$talalt = false;

while ($row = mysqli_fetch_assoc($result)) {
    echo '
    <div class="info">
        <img src="../frontend/images/odometer/'.$row["kep_url"].'" alt="odometerImage">
        <ul>
            <li>Forgalmi rendszám: '.$row["auto_id"].'</li>
            <li>Km óra állása: '.number_format((int)$row["allas"], 0, ',', ' ').' km</li>
            <li>Kép készítés időpontja: '.$row["fenykep_time"].'</li>
            <li>Rögzítés időpontja: '.$row["cre_time"].'</li>
            <li>Megjegyzés: '.$row["megjegyzes"].'</li>
        </ul>
  ';
  $talalt = true;
};

if ($talalt == false) {
    echo '<div class="info"><p class="err">Hiba történt! Nem található a megadott forgalmi rendszámmal rendelkező gépjármű a rendszerben!</p>';
}


echo '</div>
</div>
</body>
</html>';


mysqli_close($conn);

?>