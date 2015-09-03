// Generated by CoffeeScript 1.9.3
var Character;

Character = (function() {
  function Character(id) {
    this.id = id;
    this.body = Matter.Bodies.rectangle(0, 0, 100, 100, {
      mass: 100,
      frictionAir: 0.25
    });
    this.mult = 1.5;
    addToWorld(this.body);
    characters[this.id] = this;
  }

  Character.prototype.rotate = function(a) {
    return this.body.angle = a;
  };

  Character.prototype.move = function(d) {
    switch (d) {
      case 'up':
        return Matter.Body.applyForce(this.body, {
          x: 0,
          y: 0
        }, Vector.mult(Vector.fromAngle(this.body.angle), this.mult));
      case 'down':
        return Matter.Body.applyForce(this.body, {
          x: 0,
          y: 0
        }, Vector.neg(Vector.mult(Vector.fromAngle(this.body.angle), this.mult)));
    }
  };

  return Character;

})();