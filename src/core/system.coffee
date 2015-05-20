Array::remove = (obj) ->
  for key, value of @
    if value.i == obj.i
      @.splice key, 1