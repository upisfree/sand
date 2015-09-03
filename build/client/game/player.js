// Generated by CoffeeScript 1.9.3
var Character, Player, Vector,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Vector = require('../global/vector.js');

Character = require('./character.js');

Player = (function(superClass) {
  extend(Player, superClass);

  function Player() {
    Player.__super__.constructor.call(this);
    window.onmousemove = (function(_this) {
      return function(e) {
        var a;
        a = Vector.toAngle(e.x, e.y, window.w, window.h);
        return _this.rotate(a);
      };
    })(this);
    window.onkeydown = (function(_this) {
      return function(e) {
        var d;
        d = '';
        switch (e.keyCode) {
          case 87:
          case 38:
            d = 'up';
            break;
          case 83:
          case 40:
            d = 'down';
        }
        return _this.move(d);
      };
    })(this);
  }

  return Player;

})(Character);

module.exports = Player;
