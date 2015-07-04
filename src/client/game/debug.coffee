Debug =
  walls: ->
    for i in [0...500]
      if Math.random() > 0.5
        w = Math.randomInt 25, 75
        h = Math.randomInt 150, 250
      else
        w = Math.randomInt 150, 250
        h = Math.randomInt 25, 75
      
      addToWorld Matter.Bodies.rectangle Math.randomInt(-window.w * 2, window.w * 2)
                                       , Math.randomInt(-window.h * 2, window.h * 2)
                                       , w
                                       , h
                                       , { isStatic: true }
  stack: ->
    addToWorld Matter.Composites.stack 0, 0, 15, 4, 0, 0, (x, y, column, row) ->
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