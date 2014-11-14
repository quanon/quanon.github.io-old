$(document).ready ->
  doing = false
  timerId = null
  blinkerId = null
  $timer = $('.js-teo-timer')
  $time = $('.js-time')
  $time.html('<i class="fa fa-play-circle-o"></i>')

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

    explosionShort = new Audio('audios/explosion_short.mp3')
    explosionLong  = new Audio('audios/explosion_long.mp3')

    timer = ->
      seconds--
      $time.text(seconds)

      if seconds == 0
        explosionLong.play()
        clearInterval(timerId)
        return

      if seconds <= 50 && seconds % 10 == 0
        explosionShort.play()

    blinker = ->
      if seconds == 0
        clearInterval(blinkerId)
        $timer.removeClass('warning')
        return

      if seconds <= 10
        $timer.toggleClass('warning')

    timerId = setInterval(timer, 1000)
    blinkerId = setInterval(blinker, 500)
