# Start
Matter.Engine.run Engine
_time = 0

# Player
player = new Player window.w / 2, window.h / 2

# Debug
Debug.stack()

# Voice
Voice.start()

# Filters
#Filters.enable()

# debug
Engine.render.gl = new PIXI.Graphics()
setTimeout ->
  Engine.render.container.addChild Engine.render.gl
, 5000

# Render
Engine.render.options.hasBounds = true
Matter.Events.on Engine, 'tick', (e) ->
  _time += 0.01

  # Voice
  Voice.update()

  # Camera
  Matter.Bounds.shift Engine.render.bounds, { x: player.body.position.x - window.w / 2, y: player.body.position.y - window.h / 2 }

  # Filters
  Filters.update _time