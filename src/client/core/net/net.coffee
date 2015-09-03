# core/net/net.coffee
# Define core.net class
utils = require '../../utils/utils.coffee'
serializer = utils.serializer
engine = require '../engine.coffee'
config = require './config.coffee'

net =
  start: ->
    net.socket.onmessage = (e) ->
      switch net.mask new Uint8Array(e.data, 0, 1)[0]
        when 'ping'
          net.ping.update e.data
        when 'fullSync'
          str = ''

          for i in new Uint8Array e.data, 1
            str += String.fromCharCode i

          world = serializer.parse str

          engine.world.gravity = world.gravity
          Matter.Composite.clear engine.world

          for i in world.bodies
            utils.addToWorld Matter.Body.create
              bounds: i.bounds
              position: i.position
              angle: i.angle
              vertices: i.vertices
              parts: i.parts
              isStatic: i.isStatic
              isSleeping: i.isSleeping          

    # net.id = net.io.io.engine.id
    
    # net.io.on 'connect', ->
    #   net.id = net.io.io.engine.id

    # pingTime = 0

    # net.io.on 'ping', ->
    #   p = Date.now() - pingTime - 5000
    #   net.ping = if p < 0 then 0 else p

    #   pingTime = Date.now()
      
    #   net.io.emit 'pong'

    # net.io.on 'first-connection-get-characters', (data) ->
    #   if data.id isnt net.id
    #     new Character data.id, data.a, data.x, data.y

    # net.io.on 'character-connected', (data) ->
    #   if data.id isnt net.id
    #     new Character data.id

    # net.io.on 'character-disconnected', (data) ->
    #   removeFromWorld characters[data.id].body
    #   delete characters[data.id]

    # net.io.on 'characters-sync', (data) ->
    #   if data.id isnt net.id
    #     # another way, like Matter.Common.extend
    #     characters[data.id].body.angle = data.a
    #     characters[data.id].body.position.x = data.x
    #     characters[data.id].body.position.y = data.y
    #   else
    #     player.body.angle = data.a
    #     player.body.position.x = data.x
    #     player.body.position.y = data.y

  mask: require './mask.coffee'
  socket: require './socket.coffee'

  id: null

  protocol: config.protocol
  address: config.address
  port: config.port

  ping: 0

# export
module.exports = net