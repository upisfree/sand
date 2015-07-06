Net =
  start: ->
    Net.io = io "#{Net.protocol}#{Net.address}:#{Net.port}"
    Net.id = Net.io.io.engine.id
    
    Net.io.on 'connect', ->
      Net.id = Net.io.io.engine.id

    Net.io.on 'first-connection-get-characters', (data) ->
      new Character data.id, data.angle, data.motion, data.x, data.y

    Net.io.on 'character-connected', (data) ->
      if data.id isnt Net.id
        new Character data.id

    Net.io.on 'character-turned', (data) ->
      if data.id isnt Net.id
        characters[data.id].rotate data.angle

    Net.io.on 'character-moved', (data) ->
      if data.id isnt Net.id
        characters[data.id].move data.direction

    Net.io.on 'character-disconnected', (data) ->
      removeFromWorld characters[data.id].body
      delete characters[data.id]

    Net.io.on 'characters-sync', (data) ->
      if data.id isnt Net.id
        # another way, like Matter.Common.extend
        characters[data.id].body.angle = data.angle
        characters[data.id].body.position.x = data.x
        characters[data.id].body.position.y = data.y
      else
        player.body.angle = data.angle
        player.body.position.x = data.x
        player.body.position.y = data.y

  io: null
  id: null

  protocol: 'http://'
  address: 'localhost'
  port: 10101

  ping: 0