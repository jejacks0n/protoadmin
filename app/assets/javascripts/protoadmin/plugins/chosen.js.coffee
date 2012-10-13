#= require chosen

$(window).on 'protoadmin', ->
  $('select').chosen({disable_search_threshold: 8})
