function Point(position) {
  this.position = position;
  this.checkers = [];
}

Point.prototype.addChecker = function(checker) {
  this.checkers.push(checker);
}

Point.prototype.removeChecker = function(checker) {
  for (var i = 0; i < this.checkers.length; i++) {
    if (this.checkers[i] == checker) {
      this.checkers.splice(i, 1);
      break;
    }
  }
}

Point.prototype.popChecker = function() {
  var checker = this.firstChecker();
  this.removeChecker(checker);
  return checker;
}

Point.prototype.firstChecker = function() {
  return this.checkers[0];
}

Point.prototype.checkersCount = function() {
  return this.checkers.length;
}

Point.prototype.playerCheckersCount = function(player) {
  var count = 0;

  for (var i = 0; i < this.checkersCount(); i++) {
    if (this.checkers[i].getPlayer() == player) {
      count++;
    }
  }

  return count;
}

Point.prototype.otherPlayerCheckersCount = function(player) {
  return this.checkersCount() - this.playerCheckersCount(player);
}
