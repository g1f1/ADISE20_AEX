<?php include ('lib/db_conn.php')?>
<!DOCTYPE html>
<html>

<head>
	<title>LOGIN</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="icon" href="imgs/g.png">


</head>
<body>

    <img src="imgs/g.png" width="600" height="210">
	<form action="login.php" method="post">
		<h2>LOGIN</h2>
		<?php if(isset($_GET['error'])) { ?>
			<p class="error"><?php echo $_GET['error']; ?></p>
		<?php } ?>
		<label>User Name</label>
		<input type="text" name="username" placeholder="Type Username...">

		<label>Password</label>
		<input type="password" name="password" placeholder="Type Password...">

		<input type="submit" value="LOGIN" name="login_user" class="log">
		
		<a href="register.php">Not a member? Sign up</a>

		
</form>
</body>
</html>
