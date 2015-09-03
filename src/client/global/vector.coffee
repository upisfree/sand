# global/vector.coffee
# Matter Vector with some utils
Vector = Matter.Vector

Vector.fromAngle = (a) ->
  a -= Math.PI / 2 # ???
  { x: Math.cos(a), y: Math.sin(a) }

Vector.toAngle = (x, y, w, h) ->
  Math.atan2(h / 2 - y, w / 2 - x) - Math.PI / 2

# export
module.exports = Vector