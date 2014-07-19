do (jQuery) ->
  $ = jQuery
  $.fn.konami = (handler, options) ->
    options = _.extend $.fn.konami.defaults, options
    keys = []

    $(@).keydown (event) ->
      keys.push event.which
      keys.shift() if keys.length > options.command.length

      if _.isEqual keys, options.command
        handler()
        keys = []

  $.fn.konami.defaults =
    command: [38, 38, 40, 40, 37, 39, 37, 39, 66, 65]

$(document).ready ->

  $(".title__logo").balloon
    contents: "トゥットゥルー♪<br />かのしぃ★です"
    position: "right"
    classname: "balloon"
    offsetX: 10
    css:
      opacity: 1
      boxShadow: 0
      backgroundColor: null
      color: null

  $(".wife__content__picture").balloon
    contents: "あんた、<br />マジなんだな？"
    position: "right"
    classname: "balloon"
    offsetX: 10
    css:
      opacity: 1
      boxShadow: 0
      backgroundColor: null
      color: null

  $(".tabs__tab").click (e) ->
    e.preventDefault()
    $(@).tab("show")

  $(window).konami -> new Audio("audios/tutturuu.mp3").play()
