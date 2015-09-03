# game/game.coffee
# Define game class

# see game/config
config = require './config.coffee'

game =
  Character: require './character.coffee'
  debug: require './debug.coffee'
  filters: require './filters.coffee'
  Player: require './player.coffee'
  Text: require './text.coffee'
  time: config.time
  characters: config.characters

# export
module.exports = game