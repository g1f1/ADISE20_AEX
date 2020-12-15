<?php
session_start();
include "db_conn.php";


$db = mysqli_connect('localhost', 'root', '', 'demo');


if (isset($_POST['login_user'])) {
  $username = mysqli_real_escape_string($db, $_POST['username']);
  $password = mysqli_real_escape_string($db, $_POST['password']);

  if (empty($username)) {
  	header("Location: index.php?error=Username is required");
     exit();
  } else
  if (empty($password)) {
  	 header("Location: index.php?error=Password is required");
      exit();

  }

 else {
  	$password = md5($password);
  	$query = "SELECT * FROM users WHERE username='$username' AND password='$password'";
  	$results = mysqli_query($db, $query);
  	if (mysqli_num_rows($results) == 1) {
  	  $_SESSION['username'] = $username;
  	  $_SESSION['success'] = "You are now logged in";
  	  header('location: home.php');
  	}else {
  		header("Location: index.php?error=Wrong username/password combination");
      exit();
  	}
  }}


?>