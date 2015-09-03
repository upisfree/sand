# game/config.coffee
# Temporary file, where stored all static values of game class.
# I've got undefined, when use `require './game'` in for example game/character.
# Recursive require, but I don't now how fix it. Any ideas? 
config =
  time: 0
  characters: []

# export
module.exports = config