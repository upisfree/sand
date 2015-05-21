Filters =
  enable: -> # on?
    Filters.pixelate = new PIXI.filters.PixelateFilter()

    Filters.color = new PIXI.filters.ColorMatrixFilter()
    Filters.color.matrix = [1,0,0,0,
                            0,1,0,0,
                            0,0,1,0,
                            0,0,0,1]

    Engine.render.container.filters = [Filters.color]
  disable: -> # off?
    Engine.render.container.filters = []
  update: (time) ->
    if Engine.render.container.filters
      Filters.color.matrix[2] = Math.sin time * 2
      Filters.color.matrix[6] = Math.cos time * 2