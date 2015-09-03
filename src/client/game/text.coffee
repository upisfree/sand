# game/text.coffee
# Define game.Text object
engine = require '../core/engine.coffee'

class Text
  constructor: (text, size, color, x, y, isBold = false, isItalic = false, font = 'Arial') ->
    style = ''

    if isBold
      style += 'bold '

    if isItalic
      style += 'italic '
    
    style += size + 'px '
    style += font

    t = new PIXI.Text text,
      font: style
      fill: color

    t.position.x = x
    t.position.y = y

    engine.render.textContainer.addChild t

    return t

# export
module.exports = Text