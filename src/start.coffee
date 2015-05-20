# Start
Matter.Engine.run Engine

# example stack
stack = Matter.Composites.stack 0, 0, 15, 4, 0, 0, (x, y, column, row) ->
  switch Math.round Math.random()
    when 0
      if Math.random() < 0.8
        return Matter.Bodies.rectangle x, y, Math.randomInt(20, 50), Math.randomInt(20, 50)
      else
        return Matter.Bodies.rectangle x, y, Math.randomInt(80, 120), Math.randomInt(20, 30)
    when 1
      sides = Math.round Math.randomInt 1, 8
      sides = (sides == 3) ? 4 : sides
      return Matter.Bodies.polygon x, y, sides, Math.randomInt(20, 50)

addToWorld stack

# Player
player = new Player window.w / 2, window.h / 2

Engine.render.options.hasBounds = true
Matter.Events.on Engine, 'tick', (e) ->
  # Camera
  Matter.Bounds.shift Engine.render.bounds, { x: player.body.position.x - window.w / 2, y: player.body.position.y - window.h / 2 }