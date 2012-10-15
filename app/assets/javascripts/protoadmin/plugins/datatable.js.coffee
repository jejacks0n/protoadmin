#= require datatable

Protoadmin 'plugin.datatable', ->
  $('[rel="datatable"]').dataTable(bJQueryUI: true, sPaginationType: 'full_numbers', sDom: '<""l>t<"F"fp>')
