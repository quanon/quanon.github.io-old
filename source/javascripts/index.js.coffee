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
