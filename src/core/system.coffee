Array::remove = (obj) ->
  for key, value of @
    if value.i == obj.i
      @.splice key, 1

# Matter aliases
addToWorld = (body) -> # single or array
  Matter.Composite.add Engine.world, body