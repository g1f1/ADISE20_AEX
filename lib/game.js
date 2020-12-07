
function rules() {
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
    
    
  };

$(function() {
    console.log( "ready!" );
  
  function init(){
    //initial board state
  	  
  };
  
  function drawBoard(){
    console.log ("Drawing the Board");
    
    drawPiece();
    
  };
  
  function drawPiece(){
    console.log( "Drawing a piece!" );
    //add piece to the DOM
    //manipulate position & color
    
  };
  
  drawBoard();
  
});