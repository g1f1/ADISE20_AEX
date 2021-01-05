 <?php include "db_conn.php";
   	  
  ?> 
  
 <!DOCTYPE html>
  <html>
  <head>
  <link rel="stylesheet" href="css/home.css">
  <script type="text/javascript" src="js/home.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Backgammon Game</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="icon" href="imgs/g.png">
  <style>

  </style>
  </head>
  <body>
  

  
  <div class="row">
    <div class="column1" >
      
    
    </div>

    <div class="column2">
  
   	<button id="back" onclick="rules()"><span>How to play?</span></button> 
      
     <button id="logout" onclick="window.location.href='logout.php'"><span>Logout</span></button> 
      
      
   <button id="info" onclick="loadDoc()">About Us</button>

	

<div class="createGame" >

<p>Welcome to the Backgammon Game!!</p> 


<button id="hide">Hide</button>
<button id="show">Show</button>

<script>
$(document).ready(function(){
  $("#hide").click(function(){
    $("p").hide();
  });
  $("#show").click(function(){
    $("p").show();
  });
});
</script>

</div>
  <button id='start' type="button">Start Game</button><br/>

		
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
