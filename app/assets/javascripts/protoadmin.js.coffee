#= require jquery
#= require bootstrap
#
#= require_self
#= require_tree ./protoadmin/layout

class @Protoadmin
Protoadmin.Layout = {}

# wait a sec and then tell everybody they can animate
jQuery -> setTimeout((-> $('body').addClass('animated')), 200)
