Voice =
  start: ->
    Voice._setPrefixes()
    
    if Voice._supportGetUserMedia()
      navigator.getUserMedia
        'audio':
          'mandatory':
            'googEchoCancellation': true
            'googNoiseSuppression': true
            'googHighpassFilter': true
            'googAutoGainControl': true
      , Voice.analyze
      , Voice.error
    else
      console.log 'Can\'t find navigator.getUserMedia()!'

  analyze: (stream) ->
    window.AudioContext = window.AudioContext || window.webkitAudioContext
    audioContext = new AudioContext()

    mediaStreamSource = audioContext.createMediaStreamSource stream

    #mediaStreamSource.connect audioContext.destination

    Voice.analyser = audioContext.createAnalyser()
    Voice.analyser.fftSize = 2048
    mediaStreamSource.connect Voice.analyser

  update: ->
    array = new Uint8Array Voice.analyser.frequencyBinCount
    Voice.analyser.getByteFrequencyData array

    Voice.average = 0
    Voice.average += parseFloat i for i in array
    Voice.average = Voice.average / array.length

    # Debug
    Engine.render.gl.clear()
    Engine.render.gl.lineStyle 1, 0x000000, 1

    for i in [0..Voice.average]
      Engine.render.gl.drawCircle player.body.position.x, player.body.position.y, i * 10 # camera!

  error: (e) ->
    console.log e

  _setPrefixes: ->
    navigator.getUserMedia = navigator.getUserMedia ||
                             navigator.webkitGetUserMedia ||
                             navigator.mozGetUserMedia ||
                             navigator.msGetUserMedia
  _supportGetUserMedia: ->
    return !!navigator.getUserMedia

  analyser: null
  average: 0