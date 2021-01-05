 <?php include "db_conn.php";
 	include "backgammon.php";
 	include "users.php"
 	  
  ?> 
  
 <!DOCTYPE html>
  <html>
  <head>
  <link rel="stylesheet" href="home.css">
  <script type="text/javascript" src="home.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Backgammon Game</title>
  <link rel="icon" href="../imgs/g.png">
  <style>

  </style>
  </head>
  <body>
  

  
  <div class="row">
    <div class="column1" >
      
    
    </div>

    <div class="column2">
   	<!----<h1>Hello, <?php echo $_SESSION['username']; ?></h1> --->
   	<button id="back" onclick="rules()"><span>How to play?</span></button> 
      
      <button id="logout" onclick="window.location.href='index.php'"><span>Logout</span></button> 


<form action="" class="createGame" >

   <label>Give username:</label>
  <input type="text" id="username" name="username"><br><br>
  
  <label>Select your Color:</label>

  <label class="container">White
  	 <input type="radio" id="pcolor" checked="checked" name="pcolor" value='W'>
  </label>
  
  <label class="container">Black
	<input type="radio" id="pcolor" name="pcolor"value='B' >
     </label>	  
<br><br>
</form>


      <button id='bc_login' class='btn btn-primary' type="button">Log to Game</button><br/>

  	  <button id='bc_reset' class='btn btn-primary' type="button">Start Game</button><br/>

	<div id='game_info'>
	
	</div>
		
		
 </div>


                  
            
    <div class="column3" >
     

      

    </div>
  </div>


  <!-------------------------------------------------------------------------------->
  
  <div id="rules" class="rules">

    <div class="rules-content">
	    <span class="close">&times;</span>
    </div>
  
  </div>


  
</body>
</html>
