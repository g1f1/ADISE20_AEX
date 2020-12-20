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


//DIMIOURGIA ZARIWN 
function drawDices() {
  var x = brd.onMove == "black" ? w*p*35.5 - h*p*4 : w*p*14.5;
  var y = h*p*23;
  Dices.position = brd.onMove == "black" ? "right" : "left";
  var diceColor = brd.onMove == "black" ? blackDiceBodyColor : whiteDiceBodyColor;
  var dotColor = brd.onMove == "black" ? blackDiceDotColor : whiteDiceDotColor;
  drawDice(ctx, x, y, h*p*4, Dices.diceValueLeft, diceColor, dotColor);
  x = brd.onMove == "black" ? x + h*p*4 + w*p : x - h*p*4 - w*p;
  drawDice(ctx, x, y, h*p*4, Dices.diceValueRight, diceColor, dotColor);
  Dices.onScreen = true;
  
  function drawDice(ctx, x, y, size, value, diceColor, dotColor) {
    
    ctx.save();
    ctx.fillStyle = diceColor;
    ctx.translate(x, y);
    roundRect(ctx, 0, 0, size, size, size * 0.1, true, false);

    //ORISMOS TWN DOTS STA ZARIA 
    var padding = 0.25;
    var x, y;
    x = padding * size;
    y = padding * size;
    dots.push({x: x, y: y});
    y = size * 0.5;
    dots.push({x: x, y: y});
    y = size * (1 - padding);
    dots.push({x: x, y: y});
    x = size * 0.5;
    y = size * 0.5;
    dots.push({x: x, y: y});
    x = size * (1 - padding);
    y = padding * size;
    dots.push({x: x, y: y});
    y = size * 0.5;
    dots.push({x: x, y: y});
    y = size * (1 - padding);
    dots.push({x: x, y: y});

    var dotsToDraw;
    if (value == 1) dotsToDraw = [3];
    else if (value == 2) dotsToDraw = [0, 6];
    else if (value == 3) dotsToDraw = [0, 3, 6];
    else if (value == 4) dotsToDraw = [0, 2, 4, 6];
    else if (value == 5) dotsToDraw = [0, 2, 3, 4, 6];
    else if (value == 6) dotsToDraw = [0, 1, 2, 4, 5, 6];
    else console.log("Dice value shall be between 1 and 6");

    ctx.fillStyle = dotColor;
    for (var i = 0; i < dotsToDraw.length; i++) {
      ctx.beginPath();
      var j = dotsToDraw[i];
      ctx.arc(dots[j].x, dots[j].y, size * 0.07, 0, 2 * Math.PI);
      ctx.fill();
    }
    ctx.restore();
  }
}
