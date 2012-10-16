#= require jquery.peity

$.extend $.fn.peity.defaults.line,
  width: 50
  height: 24
  strokeWidth: 1
  sentements:
    positive: {colour: '#B1FFA9', strokeColour: '#459D1C'}
    negative: {colour: '#FFC4C7', strokeColour: '#BA1E20'}
    neutral: {colour: '#CCCCCC', strokeColour: '#757575'}

$.extend $.fn.peity.defaults.bar,
  width: 50
  height: 24
  sentements:
    positive: {colour: '#459D1C'}
    negative: {colour: '#BA1E20'}
    neutral: {colour: '#757575'}

$.extend $.fn.peity.defaults.pie,
  diameter: 24
  sentements:
    positive: {colours: ['#CCCCCC', '#459D1C']}
    negative: {colours: ['#CCCCCC', '#BA1E20']}
    neutral: {colours: ['#CCCCCC', '#757575']}

Protoadmin 'plugin.peity', ->
  for el in $('[rel="peity"]')
    $el = $(el)
    type = $el.data('type') || 'bar'
    sentement = 'neutral'
    sentement = 'positive' if $el.hasClass('positive')
    sentement = 'negative' if $el.hasClass('negative')
    $el.peity(type, $.fn.peity.defaults[type].sentements[sentement])
