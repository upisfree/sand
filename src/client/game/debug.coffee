# game/filters.coffee
# Define game.debug object
Text = require './text.coffee'

debug =
  start: ->
    debug._text = new Text 'sand 0.0.1', 22, 0x000000, 0, 0, true

    f = new PIXI.filters.PixelateFilter()
    f.size.x = f.size.y = 2
    debug._text.filters = [f]
  update: (fps, ping, voice, playerX, playerY) ->
    debug._text.text = """
                       sand 0.0.1
                       fps: #{Math.round fps}
                       ping: #{ping}
                       voice: #{Math.round voice}
                       x: #{Math.round playerX}
                       y: #{Math.round playerY}
                       """

    debug._text.position.x = playerX - window.w / 2 + 12
    debug._text.position.y = playerY - window.h / 2 + 12
  _text: null

# export
module.exports = debug