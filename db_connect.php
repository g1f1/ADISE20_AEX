<?php
$user='root';
$pass='000000';
$host='localhost';
$db = 'THE_DB';


$mysqli = new mysqli($host, $user, $pass, $db,null,'C:/mysql/run/mysql.sock');
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . 
    $mysqli->connect_errno . ") " . $mysqli->connect_error;
}?>
