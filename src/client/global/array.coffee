# global/array.coffee
# Array object with some utils
Math = require './math.coffee'

Array::first = ->
  @[0]

Array::last = ->
  @[@length - 1]

Array::random = ->
  @[Math.randomInt 0, @length - 1]

Array::min = ->
  Math.min.apply null, @

Array::max = ->
  Math.max.apply null, @

Array::remove = (obj) ->
  for key, value of @
    if value.i == obj.i
      @splice key, 1

Array::toObject = (key) ->
  obj = {}
  for i in this
    obj[i[key]] = i
  obj

# export
module.exports = Array