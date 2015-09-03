# game/filters.coffee
# Define game.filters object
engine = require '../core/engine.coffee'

filters =
  enable: -> # on?
    filters.pixelate = new PIXI.filters.PixelateFilter()

    filters.color = new PIXI.filters.ColorMatrixFilter()
    filters.color.matrix = [1,0,0,0,
                            0,1,0,0,
                            0,0,1,0,
                            0,0,0,1]

    engine.render.container.filters = [filters.pixelate]
  disable: -> # off?
    engine.render.container.filters = []
  update: (time) ->
    if engine.render.container.filters
      filters.color.matrix[2] = Math.sin time * 2
      filters.color.matrix[6] = Math.cos time * 2

# export
module.exports = filters