class Player
  constructor: (x, y) ->
    @body = Matter.Bodies.rectangle x, y, 100, 100,
      mass: 100
      frictionAir: 0.25
  
    @enableControl @body

    addToWorld @body
  enableControl: (body) ->
    window.onmousemove = (e) ->
      body.angle = Vector.toAngle e.x, e.y

    window.onkeydown = (e) ->
      mult = 1.5

      switch e.keyCode
        when 87, 38 # up
          Matter.Body.applyForce body, { x: 0, y: 0 }, Matter.Vector.mult(Vector.fromAngle(body.angle), mult)
        when 83, 40 # down
          Matter.Body.applyForce body, { x: 0, y: 0 }, Matter.Vector.neg(Matter.Vector.mult(Vector.fromAngle(body.angle), mult))
