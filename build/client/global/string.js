// Generated by CoffeeScript 1.9.3
var Math;

Math = require('./math.js');

String.prototype.random = function() {
  return this[Math.randomInt(0, this.length - 1)];
};

module.exports = String;