# Start!
# Save world snapeshots every tick
Matter.Events.on Engine, 'tick', ->
  keys = Object.keys spanshots

  if keys.length > 1000
    delete spanshots[keys[0]]

  spanshots[Date.now()] = cloneObject Engine.world

Net.start()

setInterval ->
  addToWorld Matter.Bodies.rectangle Math.randomInt(0, 1920), Math.randomInt(0, 1080), Math.randomInt(25, 100), Math.randomInt(25, 100)
, 250

Matter.Engine.run Engine


# coffee -b -c -o build/server/ src/server/
# ctrl+shif+f — замена
# broserify build/server/start.js -o build/server.js
#
# require в ressurect.js (и в клиенте?)



# io = require('socket.io')(10101)

# pingString = 'qwertyuiopasdfghjklzxcvbnm123456'

# io.on 'connection', (socket) ->
#   now = 0
#   ping = 32
#   _ping = 0
#   interval = null

#   console.log socket.id

#   setInterval ->
#     now = Date.now()
#     socket.emit 'ping'
#   , 5000

#   socket.on 'pong', ->
#     _ping = Date.now() - now
#     console.log _ping + ' — ' + socket.id

#   for own k, v of characters
#    socket.emit 'first-connection-get-characters',
#      id: v.id
#      a: v.body.angle
#      x: v.body.position.x
#      y: v.body.position.y

#   c = new Character socket.id

#   io.emit 'character-connected',
#     id: socket.id

#   socket.on 'character-turned', (data) ->
#     c.rotate data.a

#   socket.on 'character-moved', (data) ->
#     c.move data.d

#   socket.on 'disconnect', ->
#     removeFromWorld c.body
#     delete characters[socket.id]

#     io.emit 'character-disconnected',
#       id: socket.id

#   syncCharacters = ->
#     setTimeout ->
#       for own k, v of characters
#         socket.emit 'characters-sync',
#           id: v.id
#           a: v.body.angle
#           x: v.body.position.x
#           y: v.body.position.y

#       syncCharacters()
#     , ping

#   syncCharacters()
