# core/net/config.coffee
# Temporary file, where stored all static values of game class.
# I've got undefined, when use `require './net'` in for example net/socket.
# Recursive require, but I don't now how fix it. Any ideas? 
config = 
  protocol: 'ws'
  address: 'localhost' #prompt 'Server address?', 'localhost'
  port: 10101

# export
module.exports = config