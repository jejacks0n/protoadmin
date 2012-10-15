#= require chosen

Protoadmin 'plugin.chosen', ->
  $('select').chosen({disable_search_threshold: 8})
