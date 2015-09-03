ws = new require 'ws'

Net =
  start: ->
    Net.server = new ws.Server
      port: Net.port

    Net.server.on 'connection', (socket) ->
      Net.event.connect socket

      socket.on 'message', (data) ->
        switch Net.mask new Uint8Array(data, 0, 1)[0]
          when 'ping'
            socket.ping = Date.now() - Net.command.ping.lastTime

      socket.on 'close', ->
        Net.event.disconnect socket

  mask: (a) ->
    masks =
      'ping': 0
      'sync': 1
      'fullSync': 2

    switch typeof a
      when 'string'
        return masks[a]
      when 'number'
        for k, v of masks
          masks[v] = k

        return masks[a]

  port: 10101
  server: null
  clients: {}
  event: {}
  command: {}