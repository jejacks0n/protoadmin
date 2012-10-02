jQuery ->
  $(document).on 'click', 'span.icon input:checkbox, th input:checkbox', ->
    $el = $(@)
    checked = $el.is(':checked')
    checkboxes = $el.parents('.widget-box, table').find('tr td:first-child input:checkbox')
    $(checkbox).attr('checked', checked) for checkbox in checkboxes
