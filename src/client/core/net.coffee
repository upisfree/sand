Net =
  start: ->
    Net.io = io "#{Net.protocol}#{Net.address}:#{Net.port}"
    Net.id = Net.io.io.engine.id
    
    Net.io.on 'connect', ->
      Net.id = Net.io.io.engine.id

    pingTime = 0

    Net.io.on 'ping', ->
      p = Date.now() - pingTime - 5000
      Net.ping = if p < 0 then 0 else p

      pingTime = Date.now()
      
      Net.io.emit 'pong'

    Net.io.on 'first-connection-get-characters', (data) ->
      if data.id isnt Net.id
        new Character data.id, data.a, data.x, data.y

    Net.io.on 'character-connected', (data) ->
      if data.id isnt Net.id
        new Character data.id

    Net.io.on 'character-disconnected', (data) ->
      removeFromWorld characters[data.id].body
      delete characters[data.id]

    Net.io.on 'characters-sync', (data) ->
      if data.id isnt Net.id
        # another way, like Matter.Common.extend
        characters[data.id].body.angle = data.a
        characters[data.id].body.position.x = data.x
        characters[data.id].body.position.y = data.y
      else
        player.body.angle = data.a
        player.body.position.x = data.x
        player.body.position.y = data.y

  io: null
  id: null

  protocol: 'http://'
  address: prompt 'Server address?', 'localhost'
  port: 10101

  ping: 0