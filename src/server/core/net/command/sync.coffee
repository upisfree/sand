Net.command.sync =
  full: (socket) ->
    world = Serializer.serialise Engine.world

    buffer = new Buffer world.length + 1  # message type (1) + world data
    buffer[0] = Net.mask 'fullSync'
    buffer.write world, 1

    socket.send buffer,
      binary: true

    socket.isFirstSyncWas = true
  diff: (socket) ->
    world = Serializer.serialise Engine.world
    # if socket.isFirstSyncWas
    #   buffer = new Buffer # message type (1) + data
    #   buffer[0] = Net.mask 'sync'

    #   if spanshots[Net.command.sync.lastDiffTime]
    #     console.log objectsDiff spanshots[Net.command.sync.lastDiffTime].bodies, Engine.world.bodies

    #   Net.command.sync.lastDiffTime = Date.now()

  lastDiffTime: null