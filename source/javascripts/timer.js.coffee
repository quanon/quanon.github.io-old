class window.Timer
  @seconds = 100

  _$timer = null
  _$time = null
  _$logo = null
  _countdownId = null
  _blinkId = null
  _seconds = null
  _doing = false

  constructor: (options) ->
    _$timer = options.$timer
    _$time = options.$time
    _$logo = options.$logo

    _initSounds.call(@)
    _initClickEvent.call(@)
    _initTime.call(@)

    return

  # private

  _initTime = =>
    _$time.html('<i class="fa fa-play-circle-o"></i>')

  _initClickEvent = =>
    _$timer.on 'click', =>
      if _doing then _stop.call(@) else _start.call(@)
      return

    return

  _start = =>
    _seconds = @seconds
    _doing = true
    _$time.text(_seconds)

    _countdownId = setInterval(_countdown, 1000)
    _blinkId = setInterval(_blink, 500)

    return

  _stop = =>
    _clearCountdown.call(@)
    _clearBlink.call(@)
    _clearEffect.call(@)
    _initTime.call(@)

    _doing = false

    return

  _initSounds = =>
    ion.sound
      sounds: [
        name: 'pop21-1'
      ,
        name: 'pop21-2'
      ,
        name: 'pop21-3'
      ,
        name: 'pop21-4'
      ,
        name: 'pop22-2'
      ]
      path: 'audios/'
      volume: 1.0
      preload: true

    return

  _countdown = =>
    _seconds--
    _$time.text(_seconds)

    _doEffect.call(@)
    _clearCountdown.call(@) if _seconds == 0

    return

  _blink = =>
    if _seconds == 0
      _clearBlink.call(@)
      return

    if _seconds <= 10
      _$timer.toggleClass('warning')
      return

    return

  _doEffect = =>
    if 15 < _seconds <= 20
      ion.sound.play('pop21-4')
    else if 10 < _seconds <= 15
      ion.sound.play('pop21-3')
    else if 5 < _seconds <= 10
      ion.sound.play('pop21-2')
    else if 0 < _seconds <= 5
      _$logo.jrumble()
      _$logo.trigger('startRumble') if _seconds == 5
      ion.sound.play('pop21-1')
    else if _seconds == 0
      ion.sound.play('pop22-2')
      _$logo.trigger('stopRumble')

    return

  _clearCountdown = =>
    clearInterval(_countdownId)
    return

  _clearBlink = =>
    _$timer.removeClass('warning')
    clearInterval(_blinkId)

  _clearEffect = =>
    _$logo.trigger('stopRumble')
