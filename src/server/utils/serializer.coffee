# core/utils/serializer.coffee
# Object serializer
# Code by @liabru, all glory is his.
serializer = new Resurrect
  prefix: '$'
  cleanup: true

serializer.parse = serializer.resurrect

serializer.serialise = (object, indent = 0) ->
  return serializer.stringify object, (key, value) ->
    if !/^#/.exec(key) and typeof value is 'number'
      fixed = parseFloat value.toFixed 3
      if fixed is 0 and value isnt 0
        return value
      return fixed

    return value
  , indent

# export
module.exports = serializer