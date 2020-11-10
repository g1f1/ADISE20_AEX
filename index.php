<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Backgammon game </title>
<script src="jquery.min.js" charset="utf-8"></script>

<link rel="stylesheet" type="text/css" href="styles.css">

<link rel="icon" href="g.png">

</head>

<body>


 <div class="loginbox">
    <img src="g.png" class="auto-style1">
    
        <form method="post" action="login.php">
        
        <?php if(isset($_GET['error'])) { ?>
			<p class="error"><?php echo $_GET['error']; ?></p>
		<?php } ?>

            <div class="txtb">
          <input type="text" name="uname">
          <span data-placeholder="Username" ></span>
        </div>

        <div class="txtb">
          <input type="password"  name="password">
          <span data-placeholder="Password" ></span>
        </div>
             <input type="submit" name="" value="Login">
            <a href="">Forgot your password?</a><br> <a href="register.php">Don't have an account?</a>
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
