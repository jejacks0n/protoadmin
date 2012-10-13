#= require gritter

$(document).on 'click', '[rel="gritter"]', ->
  $el = $(@)
  $.gritter.add
    title: $el.attr('title')
    text: $el.data('message')
    image: $el.data('image')
    sticky: $el.data('sticky')
