# Code by @liabru, all glory is his.
Resurrect = require '../lib/resurrect.js'

Serializer = new Resurrect
  prefix: '$'
  cleanup: true

Serializer.parse = Serializer.resurrect

Serializer.serialise = (object, indent = 0) ->
  return Serializer.stringify object, (key, value) ->
    if !/^#/.exec(key) and typeof value is "number"
      fixed = parseFloat value.toFixed 3
      if fixed is 0 && value isnt 0
        return value
      return fixed

    return value
  , indent