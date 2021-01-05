function DiceNumberGenerator() {
}

DiceNumberGenerator.prototype.generate = function() {
  return Math.floor((Math.random()*6)+1);
}

function MockDiceNumberGenerator() {
  this.toGenerate = [];
}

MockDiceNumberGenerator.prototype.addNextPair = function(nr1, nr2) {
  this.toGenerate.push(nr1);
  this.toGenerate.push(nr2);
}

MockDiceNumberGenerator.prototype.generate = function() {
  return this.toGenerate.pop();
}
