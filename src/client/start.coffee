# start.coffee
# Start game

# define global width and height aliases
window.w = window.innerWidth
window.h = window.innerHeight

# require
core = require './core/core.coffee'
game = require './game/game.coffee'
engine = core.engine
Player = game.Player
debug = game.debug
net = core.net
voice = core.voice
filters = game.filters

# start
Matter.Engine.run engine

# Player
player = new Player window.w / 2, window.h / 2

# Debug
debug.start()

# Net
net.start()

# Voice
#voice.start()

# Filters
#filters.enable()

# debug
engine.render.gl = new PIXI.Graphics()
setTimeout ->
  engine.render.container.addChild engine.render.gl
, 5000

# Render
engine.render.options.hasBounds = true
Matter.Events.on engine, 'tick', (e) ->
  game.time += 0.01

  # Voice
  #voice.update()

  # Camera
  Matter.Bounds.shift engine.render.bounds, { x: player.body.position.x - window.w / 2, y: player.body.position.y - window.h / 2 }

  # Filters
  filters.update game.time

  # Debug
  debug.update engine.timing.fps, net.ping.value, voice.average, player.body.position.x, player.body.position.y