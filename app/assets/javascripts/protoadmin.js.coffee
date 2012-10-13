#= require jquery
#= require jquery_ujs
#
#= require protoadmin/plugins/bootstrap
#= require protoadmin/plugins/datatable
#= require protoadmin/plugins/chosen
#= require protoadmin/plugins/gritter
#
#= require protoadmin/plugins/pjax
#
#= require_self
#= require_tree ./protoadmin/layout
#= require_tree ./protoadmin/modules

class @Protoadmin
Protoadmin.Layout = {}

jQuery ->

  # wait a sec and then tell everybody they can animate using css transitions
  setTimeout((-> $('body').addClass('animated')), 200)

  # since we have the pjax support on the back end, make all ajax requests
  # behave as though they're pjax for rendering
  $.ajaxSetup(headers: {'X-PJAX': true})
