#= require datatable

$(window).on 'protoadmin', ->
  $('[rel="datatable"]').dataTable(bJQueryUI: true, sPaginationType: "full_numbers", sDom: '<""l>t<"F"fp>')
