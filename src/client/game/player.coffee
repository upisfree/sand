class Player extends Character
  constructor: ->
    super()

    p = @

    window.onmousemove = (e) ->
      a = Vector.toAngle e.x, e.y

      p.rotate a

      Net.io.emit 'character-turned',
        angle: a

    window.onkeydown = (e) ->
      d = ''

      switch e.keyCode
        when 87, 38 # up
          d = 'up'
        when 83, 40 # down
          d = 'down'

      p.move d

      Net.io.emit 'character-moved',
        direction: d