Net.event.connect = (socket) ->
  id = getRandomString 16
  socket.id = id
  Net.clients[id] = socket
  
  Log id + ' has been connected.'

  # send ping
  Net.command.ping.send socket

  setInterval ->
    Net.command.ping.send socket

    clearInterval socket.loop

    socket.loop = setInterval ->
      if socket.isFirstSyncWas
        Net.command.sync.diff socket
    , socket.ping
  , 5000

  # first sync
  if not socket.isFirstSyncWas
    Net.command.sync.full socket

  # start sync loop
  socket.loop = setInterval ->
    if socket.isFirstSyncWas
      Net.command.sync.diff socket
  , socket.ping
