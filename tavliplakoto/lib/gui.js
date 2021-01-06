var whiteDiceNrs = [
  "white-one", "white-two", "white-three", "white-four", "white-five", "white-six"
];
var brownDiceNrs = [
  "brown-one", "brown-two", "brown-three", "brown-four", "brown-five", "brown-six"
];

var PLAYER1 = new Player("Player1");
var PLAYER2 = new Player("Player2");
var GAME = new Game(PLAYER1, PLAYER2);

$(function() {
  showStartUpWindow();

  $("#player1Input").click(function() {
    $("#player1Input").val("");
  });

  $("#player2Input").click(function() {
    $("#player2Input").val("");
  });

  $('#menu').click(function() {
    $('#menuDialog').dialog({
      autoOpen : false,
      show : "blind",
      hide : "explode",
      buttons : {
        "Start a new game" : function() {
          $(this).dialog("close");
          window.location.reload();
        },
        Resume : function() {
          $(this).dialog("close");
        }
      }
    });

    $('#menuDialog').dialog("open");
    return false;
  });

  $("#undo").click(function() {
    GAME.undo();
    redrawCheckers();
  });

  $("#submit").click(function() {
    GAME.finishTurn();
    redrawBasics();
    redrawDices();
  });

  $('#send').click(function() {
    if ($('#chat_input').val() != "") {
      consoleAddMessage($('#chat_input').val());
      $('#chat_input').val('');
    }
  });
});

function showStartUpWindow() {
  $("#dialog-modal").dialog({
    height : 'auto',
    modal : true,
    hide : "explode",
    buttons : {
      "Start new game" : function() {
        startNewGame();
        $(this).dialog("close");
      }
    }
  });
}

function startNewGame() {
  if ($("#player1Input").val() != "") {
    PLAYER1.name = $("#player1Input").val();
  }

  if ($("#player2Input").val() != "") {
    PLAYER2.name = $("#player2Input").val();
  }

  $("#player1Name").text(PLAYER1.name);
  $("#player2Name").text(PLAYER2.name);

  GAME.start();

  showBrownDice(1, GAME.diceRoller.firstValue);
  showWhiteDice(1, GAME.diceRoller.secondValue);

  redrawBasics();
  redrawCheckers();
}

function redrawBasics() {
  $("#player1, #player2").removeClass("selected");

  if (GAME.currentPlayer == PLAYER1) {
    $("#player1").addClass("selected");
  } else {
    $("#player2").addClass("selected");
  }
  consoleAddMessage(GAME.currentPlayer.name+"'s turn");
}

function redrawDices() {
  $(".dice").hide();
  if (GAME.currentPlayer == PLAYER1) {
    showBrownDice(1, GAME.diceRoller.firstValue);
    showBrownDice(2, GAME.diceRoller.secondValue);
  } else {
    showWhiteDice(1, GAME.diceRoller.firstValue);
    showWhiteDice(2, GAME.diceRoller.secondValue);
  }
}

function redrawCheckers() {
  $(".checker").remove();

  for (var i = 1; i < 25; i++) {
    var point = GAME.getPoint(i);
    var checkers = point.checkers;

    for (var j = 0; j < checkers.length; j++) {
      var checker = checkers[j];

      if (checker.getPlayer() == PLAYER1) {
        var element = generateBrownChecker();
      } else {
        var element = generateWhiteChecker();
      }

      var position = getCheckerPosition(i, j);
      $("#point" + i).append(element);

      element[0].style.top = position.top;
      element[0].style.left = position.left;
    }
  }

  var player1GraveyardEl = $("#point-player1-graveyard");
  var checkersCount = GAME.player1Graveyard.checkersCount();
  for (var i = 0; i < checkersCount; i++) {
    var element = generateBrownChecker();
    player1GraveyardEl.append(element);
    console.log(element);
    element[0].style.top = "10px";
    element[0].style.left = 0;
  }

  var player2GraveyardEl = $("#point-player2-graveyard");
  var checkersCount = GAME.player2Graveyard.checkersCount();
  for (var i = 0; i < checkersCount; i++) {
    var element = generateWhiteChecker();
    player2GraveyardEl.append(element);
    console.log(element);
    element[0].style.top = "10px";
    element[0].style.left = 0;
  }

  var player1HomeEl = $("#point-player1-home");
  var checkersCount = GAME.player1Home.checkersCount();
  for (var i = 0; i < checkersCount; i++) {
    var element = generateSmallBrownChecker();
    player1HomeEl.append(element);
    console.log(element);
    element[0].style.top = "10px";
    element[0].style.left = 0;
  }

  var player2HomeEl = $("#point-player2-home");
  var checkersCount = GAME.player2Home.checkersCount();
  for (var i = 0; i < checkersCount; i++) {
    var element = generateSmallWhiteChecker();
    player2HomeEl.append(element);
    console.log(element);
    element[0].style.top = "10px";
    element[0].style.left = 0;
  }

  $(".checker").draggable({
    revert: "invalid",
    start: function() {
      // siia funktsiooni sisu
      var source = $(this).parent();
      var sourcePoint = getPointUsingDomId(source.attr("id"));
      var checker = sourcePoint.checkers[0];
      if(checker.player != GAME.currentPlayer){
        return false;
      }
      var moves = GAME.availableMoves();
      for (var m in moves) {
        var move = moves[m];
        if (move.from == sourcePoint) {
          if (GAME.currentPlayer == PLAYER1) {
            var element = generateBrownChecker();
          } else {
            var element = generateWhiteChecker();
          }
          element.addClass('temp');
          var position = getCheckerPosition(move.to.position, GAME.getCheckersCountOnPoint(move.to.position));
          $("#point" + move.to.position).append(element);

          element[0].style.top = position.top;
          element[0].style.left = position.left;
          element[0].style.opacity = '0.3';
        }
      }
    },
    stop: function() {
      $(".temp").remove();
    }
  });

  $(".point").droppable({
    drop: function(event, ui) {
      var source = $(ui.draggable).parent();
      var target = $(this);

      var sourcePoint = getPointUsingDomId(source.attr("id"));
      var targetPoint = getPointUsingDomId(target.attr("id"));

      if (GAME.canMove(sourcePoint, targetPoint)) {
        GAME.moveChecker(sourcePoint, targetPoint);
      }
      redrawCheckers();
    }
  });

  $(".checker").on("click", function() {
    var source = $(this).parent();
    var sourcePoint = getPointUsingDomId(source.attr("id"));
    var checker = sourcePoint.checkers[0];
    if(checker.player != GAME.currentPlayer){
      return false;
    }
    $(".checker").removeClass("selected");
    $(this).addClass("selected");
  });
}

function getPointUsingDomId(domId) {
  var id = domId.replace("point", "");
  if (id == "-player1-graveyard") {
    return GAME.player1Graveyard;
  } else if (id == "-player1-home") {
    return GAME.player1Home;
  } else if (id == "-player2-graveyard") {
    return GAME.player2Graveyard;
  } else if (id == "-player2-home") {
    return GAME.player2Home;
  } else {
    return GAME.getPoint(id);
  }
}

// nr - dice number 1 to 2
// value - 1 to 6
function showWhiteDice(nr, value) {
  var dice = $("#whiteDiceNr" + nr);
  dice.parent().show();
  dice.show();
  animateDice(dice, whiteDiceNrs, value);
}

// nr - dice number 1 to 2
// value - 1 to 6
function showBrownDice(nr, value) {
  var dice = $("#brownDiceNr" + nr);
  dice.parent().show();
  dice.show();
  animateDice(dice, brownDiceNrs, value);
}

// dice - dice jquery object
// numbers - array of number classes
// value - final value 1 to 6
function animateDice(dice, numbers, value) {
  dice.removeClass().addClass("dice");

  var lastClass = null;
  var count = 0;
  var nrGenerator = new DiceNumberGenerator();

  var showRandomNr = function() {
    var randomNr = nrGenerator.generate() - 1;
    dice.removeClass(lastClass);
    dice.addClass(numbers[randomNr])
    lastClass = numbers[randomNr];

    if (count <= 8) {
      setTimeout(function() {
        showRandomNr();
      }, 80);
    } else {
      dice.removeClass(lastClass);
      dice.addClass(numbers[value - 1]);
    }
    count++;
  }

  showRandomNr();
}

function consoleAddMessage(message) {
  $('#log').append(message + "<br />");
  $('#log').animate({
    scrollTop : $("#log")[0].scrollHeight - $("#log").height()
  }, 1000, function() {
  });
}

function generateBrownChecker() {
  return $("<div>").addClass("checker checker-brown pointer");
}

function generateWhiteChecker() {
  return $("<div>").addClass("checker checker-white pointer");
}

function generateSmallBrownChecker() {
  return $("<div>").addClass("topdown-checker topdown-brown");
}

function generateSmallWhiteChecker() {
  return $("<div>").addClass("topdown-checker topdown-white");
}

function getCheckerPosition(pointNr, checkerNr) {
  var count = GAME.getCheckersCountOnPoint(pointNr);
  if(pointNr > 12){ // top
    if(checkerNr > 5){ // overlaps
      var top = 5*40-(checkerNr-5)*40+20;
    }
    else {
     var top = checkerNr*40;
    }
  }
  else { // bottom
    if(checkerNr > 5){ // overlaps
      var top = (checkerNr-6)*40;
    }
    else {
     var top = 20+4*40-checkerNr*40;
    }

  }
  return {
    top:  top + "px",
    left: "0px"
  };
}
