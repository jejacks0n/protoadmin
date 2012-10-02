#= require jquery
#= require bootstrap
#
#= require_self
#= require_tree ./protoadmin/layout
#= require_tree ./protoadmin/modules
#
#= require protoadmin/plugins/datatable
#= require protoadmin/plugins/chosen
#= require protoadmin/plugins/gritter
#

class @Protoadmin
Protoadmin.Layout = {}

jQuery ->
  # wait a sec and then tell everybody they can animate
  setTimeout((-> $('body').addClass('animated')), 200)
  # make things have tooltips
  $('[rel="tooltip"]').tooltip()
