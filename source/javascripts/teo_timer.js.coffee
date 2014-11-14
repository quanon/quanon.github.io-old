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

    audios =
      pop4: new Audio('audios/pop4.wav')
      pop3: new Audio('audios/pop3.wav')
      pop2: new Audio('audios/pop2.wav')
      pop1: new Audio('audios/pop1.wav')
      kyupon: new Audio('audios/kyupon.wav')

    timer = ->
      seconds--
      $time.text(seconds)

      if 15 < seconds <= 20
        audios.pop4.load()
        audios.pop4.play()
      else if 10 < seconds <= 15
        audios.pop3.load()
        audios.pop3.play()
      else if 5 < seconds <= 10
        audios.pop2.load()
        audios.pop2.play()
      else if 0 < seconds <= 5
        audios.pop1.load()
        audios.pop1.play()
      else if seconds == 0
        audios.kyupon.load()
        audios.kyupon.play()
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
