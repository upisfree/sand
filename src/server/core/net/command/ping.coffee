Net.command.ping =
  send: (socket) ->
    Net.command.ping.buffer = new Buffer 65 # message type (1) + random data (64)
    Net.command.ping.buffer[0] = Net.mask 'ping'

    Net.command.ping.lastTime = Date.now()

    socket.send Net.command.ping.buffer,
      binary: true

  buffer: null
  lastTime: null