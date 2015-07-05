class Character
  constructor: (@id) ->
    @body = Matter.Bodies.rectangle 0, 0, 100, 100,
      mass: 100
      frictionAir: 0.25
  
    @mult = 1.5

    addToWorld @body

    characters[@id] = @
  rotate: (a) ->
    @body.angle = a
  move: (d) ->
    switch d
      when 'up'
        Matter.Body.applyForce @body, { x: 0, y: 0 }, Vector.mult(Vector.fromAngle(@body.angle), @mult)
      when 'down'
        Matter.Body.applyForce @body, { x: 0, y: 0 }, Vector.neg(Vector.mult(Vector.fromAngle(@body.angle), @mult))