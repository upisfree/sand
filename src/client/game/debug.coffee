Debug =
  start: ->
    Debug._text = new Text 'sand 0.0.1', 22, 0x000000, 0, 0, true

    f = new PIXI.filters.PixelateFilter()
    f.size.x = f.size.y = 2
    Debug._text.filters = [f]
  update: ->
    Debug._text.text = """
                       sand 0.0.1
                       x: #{player.body.position.x.toFixed()}
                       y: #{player.body.position.y.toFixed()}
                       ping: #{Net.ping}
                       """

    Debug._text.position.x = player.body.position.x - window.w / 2 + 12
    Debug._text.position.y = player.body.position.y - window.h / 2 + 12
  _text: null