<?php
session_start();
include "db_conn.php";


$username = "";
$email    = "";
$errors = array(); 


$db = mysqli_connect('localhost', 'root', '', 'demo');


if (isset($_POST['reg_user'])) {
    $username = mysqli_real_escape_string($db, $_POST['username']);
  $email = mysqli_real_escape_string($db, $_POST['email']);
  $password_1 = mysqli_real_escape_string($db, $_POST['password_1']);
  $password_2 = mysqli_real_escape_string($db, $_POST['password_2']);


  if (empty($username)) {header("Location: register.php?error=Username is required");
      exit();
	 }
  if (empty($email)) { header("Location: register.php?error=Email is required"); exit();
 }
  if (empty($password_1)) { header("Location: register.php?error=Password is required");exit();
 }
  if ($password_1 != $password_2) {
	header("Location: register.php?error=The two passwords do not match"); exit();
  }
 
  $user_check_query = "SELECT * FROM users WHERE username='$username' OR email='$email' LIMIT 1";
  $result = mysqli_query($db, $user_check_query);
  $user = mysqli_fetch_assoc($result);
  
  if ($user) {     if ($user['username'] === $username) {
      header("Location: register.php?error=Username already exists");
      exit();

    }
else 
    if ($user['email'] === $email) {
     header("Location: register.php?error=Email already exists");
     exit();

    }
  }

else{
    $password = md5($password_1);
  	$query = "INSERT INTO users (username, email, password) 
  			  VALUES('$username', '$email', '$password')";
  	mysqli_query($db, $query);
  	$_SESSION['username'] = $username;
  	$_SESSION['success'] = "You are now logged in";
  	header("Location: tavliplakoto/index.html");
  
}}

// ... 