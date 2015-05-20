# remove “return”?

Math.randomInt = (min, max) ->
  return Math.floor Math.random() * (max - min + 1) + min

Math.radiansToDegrees = (r) ->
  return r * (180 / Math.PI)

Math.degreesToRadians = (d) ->
  return d * (Math.PI / 180)

Math.angleFromVector = (x, y) ->
  return Math.atan2(window.h / 2 - y, window.w / 2 - x) - Math.PI / 2

Vector = Matter.Vector
Vector.fromAngle = (a) ->
  a -= Math.PI / 2 # ???
  return { x: Math.cos(a), y: Math.sin(a) }

Array::min = ->
  Math.min.apply null, this

Array::max = ->
  Math.max.apply null, this