io = require('socket.io')(10101)

io.on 'connection', (socket) ->
  for own k, v of characters
    socket.emit 'first-connection-get-characters',
      id: v.id
      angle: v.body.angle
      motion: v.body.motion
      x: v.body.position.x
      y: v.body.position.y

  c = new Character socket.id

  io.emit 'character-connected',
    id: socket.id

  socket.on 'character-turned', (data) ->
    c.rotate data.angle

    io.emit 'character-turned',
      angle: data.angle
      id: socket.id

  socket.on 'character-moved', (data) ->
    c.move data.direction

    io.emit 'character-moved',
      direction: data.direction
      id: socket.id

  socket.on 'disconnect', ->
    removeFromWorld c.body
    delete characters[socket.id]

    io.emit 'character-disconnected',
      id: socket.id

  # setInterval ->
  #   for own k, v of characters
  #     io.emit 'characters-sync',
  #       id: v.id
  #       angle: v.body.angle
  #       motion: v.body.motion
  #       x: v.body.position.x
  #       y: v.body.position.y
  # , 5000

Matter.Engine.run Engine