io = require('socket.io')(10101)

pingString = 'qwertyuiopasdfghjklzxcvbnm123456'

io.on 'connection', (socket) ->
  now = 0
  ping = 32
  interval = null

  #setInterval ->
  #  now = Date.now()
  #  socket.emit 'ping'
  #, 5000

  socket.on 'pong', ->
    ping = Date.now() - now
    console.log ping + ' — ' + socket.id

  for own k, v of characters
   socket.emit 'first-connection-get-characters',
     id: v.id
     a: v.body.angle
     x: v.body.position.x
     y: v.body.position.y

  c = new Character socket.id

  io.emit 'character-connected',
    id: socket.id

  socket.on 'character-turned', (data) ->
    c.rotate data.a

  socket.on 'character-moved', (data) ->
    c.move data.d

  socket.on 'disconnect', ->
    removeFromWorld c.body
    delete characters[socket.id]

    io.emit 'character-disconnected',
      id: socket.id

  syncCharacters = ->
    setTimeout ->
      for own k, v of characters
        socket.emit 'characters-sync',
          id: v.id
          a: v.body.angle
          x: v.body.position.x
          y: v.body.position.y

      syncCharacters()
    , ping

  syncCharacters()

Matter.Engine.run Engine