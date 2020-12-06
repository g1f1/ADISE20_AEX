<?php 
session_start();

if (isset($_SESSION['ID']) && isset($_SESSION['User'])) {
	?>
	
<!DOCTYPE html>
<html>
<head>
	<title>HOME</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	  <h1>Hello, <?php echo $_SESSION['ID']; ?></h1>  
	  <a href="logout.php">Logout</a>
</body>
</html>

<?php
}else{
	  header("Location: index.php");
   	  exit();
}

 ?>