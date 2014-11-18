$(document).ready ->
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

  doing = false
  timerId = null
  blinkerId = null
  $timer = $('.js-teo-timer')
  $time = $('.js-time')
  $time.html('<i class="fa fa-play-circle-o"></i>')
  $teo = $('.js-teo-timer__logo')

  $timer.on 'click', ->
    if doing
      clearInterval(timerId)
      clearInterval(blinkerId)
      $time.html('<i class="fa fa-play-circle-o"></i>')
      doing = false
      return

    seconds = 100
    doing = true
    $time.text(seconds)

    timer = ->
      seconds--
      $time.text(seconds)

      if 15 < seconds <= 20
        ion.sound.play('pop21-4')
      else if 10 < seconds <= 15
        ion.sound.play('pop21-3')
      else if 5 < seconds <= 10
        ion.sound.play('pop21-2')
      else if 0 < seconds <= 5
        $teo.jrumble()
        $teo.trigger('startRumble') if seconds == 5
        ion.sound.play('pop21-1')
      else if seconds == 0
        ion.sound.play('pop22-2')
        $teo.trigger('stopRumble')
        clearInterval(timerId)
        return

    blinker = ->
      if seconds == 0
        $timer.removeClass('warning')
        clearInterval(blinkerId)
        return

      if seconds <= 10
        $timer.toggleClass('warning')

    timerId = setInterval(timer, 1000)
    blinkerId = setInterval(blinker, 500)
