# Math
Math.randomInt = (min, max) ->
  Math.floor Math.random() * (max - min + 1) + min

Math.radiansToDegrees = (r) ->
  r * (180 / Math.PI)

Math.degreesToRadians = (d) ->
  d * (Math.PI / 180)

# Vector
Vector = Matter.Vector

Vector.fromAngle = (a) ->
  a -= Math.PI / 2 # ???
  { x: Math.cos(a), y: Math.sin(a) }

Vector.toAngle = (x, y) ->
  Math.atan2(window.h / 2 - y, window.w / 2 - x) - Math.PI / 2

# Array
Array::first = ->
  this[0]

Array::last = ->
  this[this.length - 1]

Array::min = ->
  Math.min.apply null, this

Array::max = ->
  Math.max.apply null, this

Array::remove = (obj) ->
  for key, value of @
    if value.i == obj.i
      @.splice key, 1

# Matter aliases
addToWorld = (body) -> # single or array
  Matter.Composite.add Engine.world, body