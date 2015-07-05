class Character
  constructor: (@id, angle = 0, motion = 0, x = 0, y = 0) -> # options object?
    @body = Matter.Bodies.rectangle x, y, 100, 100,
      angle: angle
      motion: motion
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