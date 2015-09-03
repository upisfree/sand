# Default objects
# Array
Array::first = ->
  this[0]

Array::last = ->
  this[this.length - 1]

Array::random = String::random = ->
  this[Math.randomInt 0, this.length - 1]

Array::min = ->
  Math.min.apply null, this

Array::max = ->
  Math.max.apply null, this

Array::remove = (obj) ->
  for key, value of @
    if value.i == obj.i
      @splice key, 1

Array::toObject = (key) ->
  obj = {}
  for i in this
    obj[i[key]] = i
  obj

# Object
cloneObject = (object) ->
  return Serializer.parse Serializer.serialise object

objectsDiff = (a, b) ->
  if a is b
    return

  # переписать, проверить, работает ли вообще. с ключами идея хорошая, узнаём разницу ключей (добавленные / удалённые),
  # пробегаемся по оставшимся вариантам, сравниваем, результаты отдаём.

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