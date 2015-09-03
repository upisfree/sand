# game/character.coffee
# Define game.Character object
Vector = require '../global/vector.coffee'
utils = require '../utils/utils.coffee'
#game = require './game.coffee'
config = require './config.coffee'

class Character
  constructor: (@id, angle = 0, x = 0, y = 0) ->
    @body = Matter.Bodies.rectangle x, y, 100, 100,
      angle: angle
      mass: 100
      frictionAir: 0.25
  
    @mult = 1.5

    utils.addToWorld @body

    #game.characters[@id] = @
    config.characters[@id] = @
  rotate: (a) ->
    @body.angle = a
  move: (d) ->
    switch d
      when 'up'
        Matter.Body.applyForce @body, { x: 0, y: 0 }, Vector.mult(Vector.fromAngle(@body.angle), @mult)
      when 'down'
        Matter.Body.applyForce @body, { x: 0, y: 0 }, Vector.neg(Vector.mult(Vector.fromAngle(@body.angle), @mult))

# export
module.exports = Character