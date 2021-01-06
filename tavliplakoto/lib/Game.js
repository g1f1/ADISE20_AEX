function Game(player1, player2) {
  this.player1 = player1;
  this.player2 = player2;
  this.currentPlayer = null;
  this.diceRoller = new DiceRoller();
  this.createPoints();
  this.history = [];

  this.player1Graveyard = new Point(25);
  this.player2Graveyard = new Point(0);
  this.player1Home = new Point(0);
  this.player2Home = new Point(25);
}

Game.prototype.start = function() {
  this.putCheckers(2, this.player1, 24);
  this.putCheckers(5, this.player1, 13);
  this.putCheckers(3, this.player1, 8);
  this.putCheckers(5, this.player1, 6);

  this.putCheckers(2, this.player2, 1);
  this.putCheckers(5, this.player2, 12);
  this.putCheckers(3, this.player2, 17);
  this.putCheckers(5, this.player2, 19);

  this.diceRoller.rollUntilNotPair();
  if (this.diceRoller.firstValue > this.diceRoller.secondValue) {
    this.setCurrentPlayer(this.player1);
  } else {
    this.setCurrentPlayer(this.player2);
  }

  this.markStarted();
}

Game.prototype.availableMoves = function() {
  var moves = [];

  var graveyard = this.currentPlayerGraveyard();

  for (var i = 1; i < 25; i++) {
    var pointX = this.getPoint(i);

    for (var j = 1; j < 25; j++) {
      var pointY = this.getPoint(j);

      if (this.canMove(pointX, pointY)) {
        moves.push({from: pointX, to: pointY});
      }
    }

    if (this.canMove(graveyard, pointX)) {
      moves.push({from: graveyard, to: pointX});
    }
  }

  return moves;
}

Game.prototype.canMove = function(sourcePoint, targetPoint) {
  if (!this.isCorrectDirection(sourcePoint, targetPoint, this.currentPlayer)) {
    return false;
  }

  var graveyard = this.currentPlayerGraveyard();
  if (graveyard.checkersCount() > 0 && sourcePoint != graveyard) {
    return false;
  }

  if (sourcePoint.playerCheckersCount(this.currentPlayer) == 0) {
    return false;
  }

  if (targetPoint.otherPlayerCheckersCount(this.currentPlayer) >= 2) {
    return false;
  }

  if (targetPoint == this.currentPlayerHome()) {
    if (this.hasCheckersOutsideHomeArea(this.currentPlayer)) {
      return false;
    }
  }

  var distance = this.getDistanceBetweenPoints(sourcePoint, targetPoint);

  if (this.hasCheckersOutsideHomeArea(this.currentPlayer)) {
    return this.diceRoller.hasValue(distance);
  } else {
    return true;
  }
}

Game.prototype.moveChecker = function(sourcePoint, targetPoint) {
  if (this.diceRoller.valuesLeft() == 0) {
    throw "No moves left";
  }

  if (!this.canMove(sourcePoint, targetPoint)) {
    throw "Invalid move";
  }

  var checker = sourcePoint.popChecker();
  targetPoint.addChecker(checker);

  var checker = targetPoint.firstChecker();
  if (checker.getPlayer() != this.currentPlayer) {
    targetPoint.removeChecker(checker);
    this.oppositePlayerGraveyard().addChecker(checker);
  }

  var distance = this.getDistanceBetweenPoints(sourcePoint, targetPoint);

  this.history.push({
    sourcePoint: sourcePoint,
    targetPoint: targetPoint,
    player: this.currentPlayer
  })
  this.diceRoller.useValue(distance);
}

Game.prototype.finishTurn = function() {
  if (this.player1Home.checkersCount() == 15) {
    alert(this.player1.name + " WON");
  }

  if (this.player2Home.checkersCount() == 15) {
    alert(this.player2.name + " WON");
  }

  if (this.diceRoller.valuesLeft() == 0 || this.availableMoves().length == 0) {
    this.switchPlayer();
    this.diceRoller.roll();
  }
}

Game.prototype.undo = function() {
  var lastMovement = this.history[this.history.length - 1];
  if (lastMovement && lastMovement.player == this.currentPlayer) {
    var sourcePoint = lastMovement.sourcePoint;
    var targetPoint = lastMovement.targetPoint;

    this.history.splice(-1, 1);

    var checker = targetPoint.popChecker();
    sourcePoint.addChecker(checker);

    var distance = this.getDistanceBetweenPoints(sourcePoint, targetPoint);
    this.diceRoller.addValue(distance);
  }
}

Game.prototype.getDistanceBetweenPoints = function(source, target) {
  return Math.abs(source.position - target.position);
}

Game.prototype.currentPlayerGraveyard = function() {
  if (this.currentPlayer == this.player1) {
    return this.player1Graveyard;
  } else {
    return this.player2Graveyard;
  }
}

Game.prototype.currentPlayerHome = function() {
  if (this.currentPlayer == this.player1) {
    return this.player1Home;
  } else {
    return this.player2Home;
  }
}

Game.prototype.getPoint = function(id) {
  return this.points[id - 1];
}

Game.prototype.switchPlayer = function() {
  if (this.currentPlayer == this.player1) {
    this.currentPlayer = this.player2;
  } else {
    this.currentPlayer = this.player1;
  }
}

Game.prototype.markStarted = function() {
  this.isStarted = true;
}

Game.prototype.setCurrentPlayer = function(player) {
  this.currentPlayer = player;
}

Game.prototype.putCheckers = function(count, player, position) {
  var checker;
  var point = this.getPoint(position);

  for (i = 0; i < count; i++) {
    checker = new Checker(player);
    point.addChecker(checker);
  }
}

Game.prototype.getCheckersCountOnPoint = function(position){
  var point = this.getPoint(position);
  return point.checkersCount();
}

Game.prototype.createPoints = function() {
  this.points = [];
  for (var i = 0; i < 24; i++) {
    this.points.push(new Point(i + 1));
  }
}

Game.prototype.isCorrectDirection = function(source, target, player) {
  if (player == this.player1) {
    return source.position > target.position;
  } else {
    return target.position > source.position;
  }
}

Game.prototype.hasCheckersOutsideHomeArea = function(player) {
  var from = 7;
  var to = 24;

  if (player != this.player1) {
    from = 1;
    to = 18;
  }

  for (var i = from; i < to; i++) {
    if (this.getPoint(i).playerCheckersCount(player) > 0) {
      return true;
    }
  }
}

Game.prototype.oppositePlayerGraveyard = function() {
  if (this.currentPlayer == this.player1) {
    return this.player2Graveyard;
  } else {
    return this.player1Graveyard;
  }
}
