#= require bootstrap

# Tooltips
Protoadmin 'plugin.bootstrap.tooltip', ->
  $('body > div.tooltip').remove()
  $('[rel="tooltip"]').tooltip()

# Modals
jQuery ->
  $('body').off 'click.modal.data-api', '[data-toggle="modal"]'
  $('body').on 'click.modal.data-api', '[rel="modal"]', (e) ->
    $el = $(@)
    e.preventDefault()
    href = $el.attr('href') || ''
    if !href || href.indexOf('#') == 0
      $target = $($el.attr('data-target') or (href and href.replace(/.*(?=#[^\s]+$)/, "")))
      option = (if $target.data('modal') then 'toggle' else $.extend(remote: not /#/.test(href) and href $target.data(), $el.data()))
      $target.modal(option).one 'hide', -> $el.focus()
    else
      $target = $('<div class="modal hide remote">')
      setContent = (content) ->
        body = $('<div class="modal-body">').append(content)
        $target.html('<div class="modal-header"><button class="close" data-dismiss="modal">×</button></div>').append(body).modal()
      $.ajax href, success: (content) ->
        $target.on 'ajax:beforeSend', (event, xhr, options) ->
          options.success = (content) -> setContent(content)
          options.complete = (xhr, type) -> $target.modal('hide') if type == 'parsererror'
        setContent(content)
