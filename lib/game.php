 include "db_conn.php";
 
 <!DOCTYPE html>
  <html>
  <head>
  <link rel="stylesheet" href="game.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="src/game.js"></script>
  
  <title>Backgammon Game</title>
  <link rel="icon" href="g.png">
  <style>

  </style>
  </head>
  <body>
  

  
  <div class="row">
    <div class="column1" >
      
    
    </div>

    <div class="column2">
      <button id="back"><span>How to play?</span></button> 
	    <h1>Hello, <?php echo $_SESSION['ID']; ?></h1>  
	  <a href="logout.php">Logout</a>
      <button type="button" id="NewGameButton">New Game</button><br/>
    <br/>
 
    <button type="button" id="Quit">Quit Game</button><br/>

    <div id="player2">
      <p>Opponent</p>
      <p>Score: 0</p>
    </div>
    <div id="player1">
      <p id="p1"> You</p>
      <p>Score: 0</p>
    </div>


      <div class = "board">
        <div class="left-bin"> 
          <div class="top-row">
            <div class="arrow-down odd"></div>
            <div class="arrow-down even"></div>
            <div class="arrow-down odd"></div>
            <div class="arrow-down even"></div>
            <div class="arrow-down odd"></div>
            <div class="arrow-down even"></div>
          </div>
      
          <div class="bottom-row"> 
            <div class="arrow-up odd"></div>
            <div class="arrow-up even"></div>
            <div class="arrow-up odd"></div>
            <div class="arrow-up even"></div>
            <div class="arrow-up odd"></div>
            <div class="arrow-up even"></div>
          </div>
        </div> 
        
        <div class = "middle-bar">
        </div>

        <button id="Roll">Roll Dice</button>

        <div class = "right-bin">
            <div class="top-row">
            <div class="arrow-down odd"></div>
            <div class="arrow-down even"></div>
            <div class="arrow-down odd"></div>
            <div class="arrow-down even"></div>
            <div class="arrow-down odd"></div>
            <div class="arrow-down even"></div>
          </div>
      
          <div class="bottom-row"> 
            <div class="arrow-up odd"></div>
            <div class="arrow-up even"></div>
            <div class="arrow-up odd"></div>
            <div class="arrow-up even"></div>
            <div class="arrow-up odd"></div>
            <div class="arrow-up even"></div>
            </div>
        </div>
      
      
      <div class="piece_1" draggable="true"></div>
      <div class="piece_2" draggable="true"></div>
      <div class="piece_3" draggable="true"></div>
      <div class="piece_4" draggable="true"></div>
      <div class="piece_5" draggable="true"></div>
      <div class="piece"></div>

      <div class="piece_6" draggable="true"></div>
      <div class="piece_7" draggable="true"></div>
      <div class="piece_8" draggable="true"></div>
      <div class="piece_9" draggable="true"></div>
      <div class="piece_10" draggable="true"></div>
      <div class="piece"></div>
      
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

<script>
    var modal = document.getElementById("rules");


var btn = document.getElementById("back");


var span = document.getElementsByClassName("close")[0];


btn.onclick = function() {
  modal.style.display = "block";
}


span.onclick = function() {
  modal.style.display = "none";
}


window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}



</script>
  
</body>
</html>

 