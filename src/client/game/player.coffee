# game/player.coffee
# Define game.Player object
Vector = require '../global/vector.coffee'
Character = require './character.coffee'

class Player extends Character
  constructor: ->
    super()

    window.onmousemove = (e) =>
      a = Vector.toAngle e.x, e.y, window.w, window.h

      @rotate a

      #Net.io.emit 'character-turned',
      #  a: a

    window.onkeydown = (e) =>
      d = ''

      switch e.keyCode
        when 87, 38 # up
          d = 'up'
        when 83, 40 # down
          d = 'down'

      @move d

      #Net.io.emit 'character-moved',
      #  d: d

# export
module.exports = Player