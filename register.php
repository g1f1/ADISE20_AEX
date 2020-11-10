

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">



<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Backgammon game </title>
<script src="jquery.min.js" charset="utf-8"></script>



<link rel="stylesheet" type="text/css" href="register.css">
<link rel="icon" href="g.png">

</head>

<body>


 <div class="loginbox">
    <img src="g.png" class="auto-style1">
    
        <form method="post" action="signup-check.php">
        
         <?php if (isset($_GET['error'])) { ?>
     		<p class="error"><?php echo $_GET['error']; ?></p>
     	<?php } ?>
     	
     	<div class="txtb">
        <?php if (isset($_GET['email'])) { ?>
               <input type="text" 
                      name="name" 
                      placeholder="Email"
                      value="<?php echo $_GET['email']; ?>">      
         <?php }else{ ?>
               <input type="text" 
                      name="email" 
                      >          
                      
                      <?php }?>
          <span data-placeholder="Email"></span>
          <?php if (isset($email_error)): ?>
      	<span><?php echo $email_error; ?></span>
      <?php endif ?>
        </div>

           
		     <div class="txtb">
          <?php if (isset($_GET['uname'])) { ?>
               <input type="text" 
                      name="uname" 
                      
                      value="<?php echo $_GET['uname']; ?>"><br>
          <?php }else{ ?>
               <input type="text" 
                      name="uname" 
                    >         
                     <?php }?>
                    <span data-placeholder="Username"></span>
                     <?php if (isset($name_error)): ?>
	  			<span><?php echo $name_error; ?></span>
			  <?php endif ?>
        </div>

        <div class="txtb">
          <input type="password" 
                 name="password" 
                 > 
                 <span data-placeholder="Password"></span>
        </div>
        <div class="txtb">
         <input type="password" 
                 name="re_password" 
                 >
                 <span data-placeholder="Re_Password"></span>

        </div>

	             <input type="submit" name="reg_user" value="Sign in">
	             
	              <a href="index.php" class="ca">Already have an account?</a>
                   </form>
        
    </div>
    
    
      <script type="text/javascript">
      $(".txtb input").on("focus",function(){
        $(this).addClass("focus");
      });

      $(".txtb input").on("blur",function(){
        if($(this).val() == "")
        $(this).removeClass("focus");
      });

      </script>

</body>

</html>
