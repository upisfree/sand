# Start
Matter.Engine.run Engine
_time = 0

Debug.stack()

# Player
player = new Player window.w / 2, window.h / 2

# Filters
#Filters.enable()

Engine.render.options.hasBounds = true
Matter.Events.on Engine, 'tick', (e) ->
  _time += 0.01

  # Camera
  Matter.Bounds.shift Engine.render.bounds, { x: player.body.position.x - window.w / 2, y: player.body.position.y - window.h / 2 }

  # Filters
  Filters.update _time