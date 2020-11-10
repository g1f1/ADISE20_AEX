<?php 
session_start(); 
include "db_conn.php";

if (isset($_POST['uname']) && isset($_POST['password'])
    && isset($_POST['email']) && isset($_POST['re_password'])) {

	function validate($data){
       $data = trim($data);
	   $data = stripslashes($data);
	   $data = htmlspecialchars($data);
	   return $data;
	}

	$uname = validate($_POST['uname']);
	$pass = validate($_POST['password']);

	$re_pass = validate($_POST['re_password']);
	$email = validate($_POST['email']);

	$user_data = 'uname='. $uname. '&email='. $email;


	if (empty($uname)) {
		header("Location: register.php?error=User Name is required&$user_data");
	    exit();
	}else if(empty($pass)){
        header("Location: register.php?error=Password is required&$user_data");
	    exit();
	}
	else if(empty($re_pass)){
        header("Location: register.php?error=Re Password is required&$user_data");
	    exit();
	}

	else if(empty($email)){
        header("Location: register.php?error=Email is required&$user_data");
	    exit();
	}

	else if($pass !== $re_pass){
        header("Location: register.php?error=The confirmation password  does not match&$user_data");
	    exit();
	}

	else{

		
        $pass = md5($pass);

	    $sql = "SELECT * FROM loginform WHERE User='$uname' AND Pass='$password	' AND Email='$email' ";
	    $result = mysqli_query($conn, $sql);

		if (mysqli_num_rows($result) !=0) {
			header("Location: register.php?error=The username is taken try another&$user_data");
	        exit();
		}else {
           $sql2 = "INSERT INTO  loginform ( User ,Pass ,Email) VALUES ('$uname', '$password' , '$email')";
           $result2 = mysqli_query($conn, $sql2);
           if ($result2) {
           	 header("Location: welcome.php");
	         exit();
           }else {
	           	header("Location: register.php?error=unknown error occurred&$user_data");
		        exit();
           }
		}
	}
	
}else{
	header("Location: register.php");
	exit();
}