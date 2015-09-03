# Matter aliases
addToWorld = (b) -> # single body or array
  Matter.World.add Engine.world, b

removeFromWorld = (body) ->
  Matter.World.remove Engine.world, b