#= require jquery.pjax

$(window).on 'pjax:end', ->
  $(window).trigger('protoadmin')

jQuery ->
  $(window).trigger('protoadmin')
  $('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax]):not([rel="modal"])').pjax('[rel="pjax-container"]')
