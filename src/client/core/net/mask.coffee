# core/net/mask.coffee
# Mask function
masks =
  'ping': 0
  'sync': 1
  'fullSync': 2

mask = (a) ->
  switch typeof a
    when 'string'
      return masks[a]
    when 'number'
      for k, v of masks
        masks[v] = k

      return masks[a]

# export
module.exports = mask