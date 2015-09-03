// Generated by CoffeeScript 1.9.3
var Vector;

Math.randomInt = function(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
};

Math.radiansToDegrees = function(r) {
  return r * (180 / Math.PI);
};

Math.degreesToRadians = function(d) {
  return d * (Math.PI / 180);
};

Vector = Matter.Vector;

Vector.fromAngle = function(a) {
  a -= Math.PI / 2;
  return {
    x: Math.cos(a),
    y: Math.sin(a)
  };
};

Vector.toAngle = function(x, y) {
  return Math.atan2(window.h / 2 - y, window.w / 2 - x) - Math.PI / 2;
};
