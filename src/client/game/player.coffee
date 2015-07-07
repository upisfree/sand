class Player extends Character
  constructor: ->
    super()

    window.onmousemove = (e) =>
      a = Vector.toAngle e.x, e.y

      @rotate a

      Net.io.emit 'character-turned',
        a: a

    window.onkeydown = (e) =>
      d = ''

      switch e.keyCode
        when 87, 38 # up
          d = 'up'
        when 83, 40 # down
          d = 'down'

      @move d

      Net.io.emit 'character-moved',
        d: d