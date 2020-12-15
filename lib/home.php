 <?php include "db_conn.php";
  ?> 
  
 <!DOCTYPE html>
  <html>
  <head>
  <link rel="stylesheet" href="home.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="home.js"></script>
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

      <button type="button" id="StartGameButton" onclick="window.location.href='game.php'">Start Game</button><br/>
    <br/>
 
   		
		
		
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
