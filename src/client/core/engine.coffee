# core/engine.coffee
# Create Matter.Engine object

# aliases
Matter.RenderPixi = require '../matter/render.coffee'

# export
module.exports = Matter.Engine.create document.body,
  world:
    gravity:
      x: 0
      y: 0
  enableSleeping: true
  render:
    controller: Matter.RenderPixi
    options:
      width: window.w
      height: window.h
      wireframes: false
      background: '#ccc'