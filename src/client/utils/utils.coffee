# utils/utils.coffee
# Define utils class and some uncategorized utils
String = require '../global/string.coffee'
engine = require '../core/engine.coffee'

utils =
  serializer: require './serializer.coffee'

  # Object
  cloneObject: (object) ->
    return utils.serializer.parse utils.serializer.serialise object

  objectsDiff: (a, b) ->
    a = a.toObject 'id'
    b = b.toObject 'id'

    ak = Object.keys a
    bk = Object.keys b

    r =
      added: []
      changed: []
      removed: []

    # check removed bodies
    for k in ak
      r.removed.push k if bk.indexOf k is -1
    
    # check added bodies
    for k in bk
      r.added.push k if ak.indexOf k is -1

    # check changed bodies
    for k, v of a
      if a[k] isnt b[k]
        r.changed.push k 

    return r

  # Matter aliases
  addToWorld: (b) -> # TODO: single body or array
    Matter.World.add engine.world, b

  removeFromWorld: (b) ->
    Matter.World.remove engine.world, b

  log: (m) ->
    d = new Date
    console.log "[#{d.getMonth() + 1}.#{d.getDate()}.#{d.getFullYear()}, #{d.getHours()}:#{d.getMinutes()}:#{d.getSeconds()}] #{m}"
  
  randomString: (length, numbers = true) ->
    letters = 'abcdefghijklmnopqrstuvwxyz'
    result = ''

    if numbers
      letters += '0123456789'

    result += letters.random() for [0..length]

    return result

# export
module.exports = utils