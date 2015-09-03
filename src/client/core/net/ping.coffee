# core/net/ping.net
# Ping functions
socket = require './socket.coffee'

ping =
  update: (data) ->
    ping.value = Date.now() - ping.lastTime - 5000 if ping.lastTime isnt null          
    ping.lastTime = Date.now()

    socket.send data

  value: 0
  lastTime: null

# export
module.exports = ping