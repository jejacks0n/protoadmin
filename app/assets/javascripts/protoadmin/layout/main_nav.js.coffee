class Protoadmin.Layout.MainNav

  @el: '#main_nav'

  constructor: ->
    @$el = $(@constructor.el)
    @build()
    @bindEvents()

  build: ->
    @$top = @$el.find('> ul')
    @$groups = @$el.find('.has-nested')
    $nestedActive = @$el.find('.has-nested .active').closest('.has-nested').addClass('active')
    @toggleGroup($nestedActive) if $(window).width() > 767

  bindEvents: ->
    @$el.find('> .btn').on('click', @toggle)
    @$groups.on('click', @onToggleGroup)
    $(window).on('resize', @onResize)
    @$el.find('li:not(.has-nested) a').on('click', @onItemActivate)

  onToggleGroup: (e) =>
    @toggleGroup($(e.target).closest('li'))

  onItemActivate: (e) =>
    item = $(e.target).closest('li')
    @closeAll() if @windowWidth() <= 767
    @deactivateActives()
    @activateItem(item) if item.length

  deactivateActives: ->
    @$el.find('li.active').removeClass('active')

  activateItem: (item) ->
    item.addClass('active')
    @activateItem(parent) if (parent = item.parents('li')).length

  toggle: =>
    opacity = @$top.css('opacity')
    @$top.toggleClass('open')
    @$top.css(height: if opacity then 'auto' else 0)

  closeAll: ->
    @$groups.find('ul').css(display: 'none', height: 0, opacity: 1)
    @$top.removeClass('open')

  toggleGroup: ($el) =>
    $sub = $el.closest('li').find('ul').first()
    $sub.css({display: 'block', height: if $sub.height() > 0 then 0 else $sub.css(display: 'block', height: 'auto').height()})

  hidePoint: ->
    width = @windowWidth()
    hidePoint = @lastWidth >= 767 && width <= 767 || @lastWidth <= 767 && width >= 767 || @lastWidth >= 480 && width <= 480 || @lastWidth <= 480 && width >= 480
    @lastWidth = width
    hidePoint

  windowWidth: ->
    $(window).width()

  onResize: =>
    @closeAll() if @hidePoint()

jQuery -> new Protoadmin.Layout.MainNav()
