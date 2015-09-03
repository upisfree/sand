# global/string.coffee
# String object with some utils
Math = require './math.coffee'

String::random = ->
  @[Math.randomInt 0, @length - 1]

# export
module.exports = String