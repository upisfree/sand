# Uncategorized utils
# /b/
# /b/
# /b/
getRandomString = (length, numbers = true) ->
  letters = 'abcdefghijklmnopqrstuvwxyz'
  result = ''

  if numbers
    letters += '0123456789'

  result += letters.random() for [0..length]

  return result

Log = (m) ->
  d = new Date
  console.log "[#{d.getMonth() + 1}.#{d.getDate()}.#{d.getFullYear()}, #{d.getHours()}:#{d.getMinutes()}:#{d.getSeconds()}] #{m}"