<<<<<<< HEAD
<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
  <title>SIGN UP</title>
   <link rel="stylesheet" type="text/css" href="css/register.css">
  <link rel="icon" href="imgs/g.png">
</head>
<body>
	
	 <img src="../imgs/g.png" width="600" height="210">

	
  <form method="post" action="server.php">
  	<?php if(isset($_GET['error'])) { ?>
			<p class="error"><?php echo $_GET['error']; ?></p>
		<?php } ?>
  	<div class="input-group">
  	  <label>Username</label>
  	  <input type="text" name="username" placeholder="Type Username..."
>
  	</div>
  	<div class="input-group">
  	  <label>Email</label>
  	  <input type="email" name="email" placeholder="Type Email..."
>
  	</div>
  	<div class="input-group">
  	  <label>Password</label>
  	  <input type="password" name="password_1" placeholder="Type Password..."
>
  	</div>
  	<div class="input-group">
  	  <label>Confirm password</label>
  	  <input type="password" name="password_2" placeholder="Re-Type Password...">
  	</div>
  	<div class="input-group">
  	  <button type="submit" class="log" name="reg_user">Register</button>
  	</div>
  	<p>
  		Already a member? <a href="login.php">Sign in</a>
  	</p>
  </form>
</body>
=======
<?php include('sign-up.php') ?>
<!DOCTYPE html>
<html>
<head>
  <title>SIGN UP</title>
   <link rel="stylesheet" type="text/css" href="css/register.css">
  <link rel="icon" href="imgs/g.png">
</head>
<body>
	
	 <img src="imgs/g.png" width="600" height="210">

	
  <form method="post" action="sign-up.php">
  	<?php if(isset($_GET['error'])) { ?>
			<p class="error"><?php echo $_GET['error']; ?></p>
		<?php } ?>
  	<div class="input-group">
  	  <label>Username</label>
  	  <input type="text" name="username" placeholder="Type Username..."
>
  	</div>
  	<div class="input-group">
  	  <label>Email</label>
  	  <input type="email" name="email" placeholder="Type Email..."
>
  	</div>
  	<div class="input-group">
  	  <label>Password</label>
  	  <input type="password" name="password_1" placeholder="Type Password..."
>
  	</div>
  	<div class="input-group">
  	  <label>Confirm password</label>
  	  <input type="password" name="password_2" placeholder="Re-Type Password...">
  	</div>
  	<div class="input-group">
  	  <button type="submit" class="log" name="reg_user">Register</button>
  	</div>
  	<p>
  		 <a href="index.php">Already a member? Sign in</a>
  	</p>
  </form>
  
  
</body>
>>>>>>> d17fbc539843cce6a3343fb50d96ecd1af331779
</html>