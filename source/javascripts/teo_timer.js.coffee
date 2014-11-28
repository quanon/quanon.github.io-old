#= require timer

$(document).ready ->
  timer = new Timer
    $timer: $('.js-teo-timer')
    $time: $('.js-time')
    $logo: $('.js-teo-timer__logo')
