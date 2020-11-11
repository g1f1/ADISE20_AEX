<!DOCTYPE html>
<html>

<head>
	<title>SIGN UP</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="icon" href="g.png">

</head>
<body>

    <img src="g.png" width="600" height="210">
	

      <form method="post" action="signup-check.php">
        
         <?php if (isset($_GET['error'])) { ?>
     		<p class="error"><?php echo $_GET['error']; ?></p>
     	<?php } ?>
     	<label>Email</label>
      <?php if (isset($_GET['email'])) { ?>
               <input type="email" 
                      name="name" 
                      placeholder="Type Email..."
                      value="<?php echo $_GET['email']; ?>">      
         <?php }else{ ?>
               <input type="email" 
                      name="email"
                      placeholder="Type Email..."
                      >          
                      
                      <?php }?>
          <?php if (isset($email_error)): ?>
      	<span><?php echo $email_error; ?></span>
      <?php endif ?>
       

           
		    <label>User Name</label>
          <?php if (isset($_GET['uname'])) { ?>
               <input type="text" 
                      name="uname" 
                      
                      value="<?php echo $_GET['uname']; ?>"><br>
          <?php }else{ ?>
               <input type="text" 
                      name="uname" 
                      placeholder="Type Username..."
                    >         
                     <?php }?>
                     <?php if (isset($name_error)): ?>
	  			<span><?php echo $name_error; ?></span>
			  <?php endif ?>
        

        <label>Password</label>
         <input type="password" 
         		placeholder="Type Password..."
                 name="password"> 
                     
			<label>Re-type Password</label>
           <input type="password" 
           		placeholder="Re-Type Password..."
                 name="re_password">
                 
           
	      <input type="submit" name="reg_user" class="log" value="Sign in">



		<a href="index.php">Already a member?Login in</a>

		
</form>
</body>
</html>
