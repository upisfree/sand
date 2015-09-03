# core/net/socket.coffee
# Socket definition
config = require './config.coffee'
#net = require './net.coffee'

#socket = new WebSocket "#{net.protocol}://#{net.address}:#{net.port}"
socket = new WebSocket "#{config.protocol}://#{config.address}:#{config.port}"
socket.binaryType = 'arraybuffer'

# export
module.exports = socket