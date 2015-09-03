Net.event.disconnect = (socket) ->
  Log socket.id + ' disconnected.'
  delete Net.clients[socket.id]