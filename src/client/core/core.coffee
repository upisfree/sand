# core/core.coffee
# Define core class
core =
  engine: require './engine.coffee'
  net: require './net/net.coffee'
  voice: require './voice.coffee'

# export
module.exports = core