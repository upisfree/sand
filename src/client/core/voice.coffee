# core/voice.coffee
# voice module
voice =
  start: ->
    voice._setPrefixes()
    
    if voice._supportGetUserMedia()
      navigator.getUserMedia
        'audio':
          'mandatory':
            'googEchoCancellation': true
            'googNoiseSuppression': true
            'googHighpassFilter': true
            'googAutoGainControl': true
      , voice.analyze
      , voice.error
    else
      console.log 'Can\'t find navigator.getUserMedia()!'

  analyze: (stream) ->
    window.AudioContext = window.AudioContext || window.webkitAudioContext
    audioContext = new AudioContext()

    mediaStreamSource = audioContext.createMediaStreamSource stream

    #mediaStreamSource.connect audioContext.destination

    voice.analyser = audioContext.createAnalyser()
    voice.analyser.fftSize = 2048
    mediaStreamSource.connect voice.analyser

  update: ->
    array = new Uint8Array voice.analyser.frequencyBinCount
    voice.analyser.getByteFrequencyData array

    voice.average = 0
    voice.average += parseFloat i for i in array
    voice.average = voice.average / array.length

    console.log voice.average

    # Debug
    #core.engine.render.gl.clear()
    #core.engine.render.gl.lineStyle 1, 0x000000, 1

    #for i in [0..voice.average]
    #  core.engine.render.gl.drawCircle player.body.position.x, player.body.position.y, i * 10 # camera!

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

# export
module.exports = voice