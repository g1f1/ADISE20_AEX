<<<<<<< HEAD
=======
<<<<<<<< HEAD:sign-up.php
<?php
session_start();
include "db_conn.php";


$username = "";
$email    = "";
$errors = array(); 


if (isset($_POST['reg_user'])) {
  $username = mysqli_real_escape_string($conn, $_POST['username']);
  $email = mysqli_real_escape_string($conn, $_POST['email']);
  $password_1 = mysqli_real_escape_string($conn, $_POST['password_1']);
  $password_2 = mysqli_real_escape_string($conn, $_POST['password_2']);


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
  $result = mysqli_query($conn, $user_check_query);
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
   	mysqli_query($conn, $query);
  	
  	$_SESSION['username'] = $username;
  	$_SESSION['success'] = "You are now logged in";
  	header("Location: home.php");
  
}}

========
>>>>>>> d17fbc539843cce6a3343fb50d96ecd1af331779
<?php
session_start();
include "db_conn.php";


$username = "";
$email    = "";
$errors = array(); 


<<<<<<< HEAD
if (isset($_POST['reg_user'])) {
  $username = mysqli_real_escape_string($conn, $_POST['username']);
  $email = mysqli_real_escape_string($conn, $_POST['email']);
  $password_1 = mysqli_real_escape_string($conn, $_POST['password_1']);
  $password_2 = mysqli_real_escape_string($conn, $_POST['password_2']);
=======
$db = mysqli_connect('localhost', 'root', '', 'demo');


if (isset($_POST['reg_user'])) {
    $username = mysqli_real_escape_string($db, $_POST['username']);
  $email = mysqli_real_escape_string($db, $_POST['email']);
  $password_1 = mysqli_real_escape_string($db, $_POST['password_1']);
  $password_2 = mysqli_real_escape_string($db, $_POST['password_2']);
>>>>>>> d17fbc539843cce6a3343fb50d96ecd1af331779


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
<<<<<<< HEAD
  $result = mysqli_query($conn, $user_check_query);
=======
  $result = mysqli_query($db, $user_check_query);
>>>>>>> d17fbc539843cce6a3343fb50d96ecd1af331779
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
<<<<<<< HEAD

		
    $password = md5($password_1);
  	$query = "INSERT INTO users (username, email, password) 
  			  VALUES('$username', '$email', '$password')";
   	mysqli_query($conn, $query);
  	
  	$_SESSION['username'] = $username;
  	$_SESSION['success'] = "You are now logged in";
  	header("Location: home.php");
  
}}

=======
    $password = md5($password_1);
  	$query = "INSERT INTO users (username, email, password) 
  			  VALUES('$username', '$email', '$password')";
  	mysqli_query($db, $query);
  	$_SESSION['username'] = $username;
  	$_SESSION['success'] = "You are now logged in";
  	header("Location: tavliplakoto/index.html");
  
}}

>>>>>>>> d17fbc539843cce6a3343fb50d96ecd1af331779:server.php
>>>>>>> d17fbc539843cce6a3343fb50d96ecd1af331779
// ... 