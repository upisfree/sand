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

  socket.on 'character-moved', (data) ->
    c.move data.direction

  socket.on 'disconnect', ->
    removeFromWorld c.body
    delete characters[socket.id]

    io.emit 'character-disconnected',
      id: socket.id

  setInterval ->
    for own k, v of characters
      socket.emit 'characters-sync',
        id: v.id
        angle: v.body.angle
        x: v.body.position.x
        y: v.body.position.y
  , 16

Matter.Engine.run Engine