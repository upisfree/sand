Voice =
  start: ->
    Voice._setPrefixes()
    
    if Voice._supportGetUserMedia()
      navigator.getUserMedia { 'audio': true }, Voice.analyze, Voice.error
    else
      console.log 'Can\'t find navigator.getUserMedia()!'

  analyze: (stream) ->
    window.AudioContext = window.AudioContext || window.webkitAudioContext
    audioContext = new AudioContext()

    mediaStreamSource = audioContext.createMediaStreamSource stream

    mediaStreamSource.connect audioContext.destination
    console.log mediaStreamSource
  error: (e) ->

    console.log e
  _setPrefixes: ->
    navigator.getUserMedia = navigator.getUserMedia ||
                             navigator.webkitGetUserMedia ||
                             navigator.mozGetUserMedia ||
                             navigator.msGetUserMedia
  _supportGetUserMedia: ->
    return !!navigator.getUserMedia