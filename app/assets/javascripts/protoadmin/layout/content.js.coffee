class Protoadmin.Layout.Content

  @el: '#content'

  constructor: ->
    @$el = $(Content.el)
    @build()
    @bindEvents()

  build: ->
    @top = @$el.offset().top - parseInt(@$el.css('margin-bottom'), 10) || 0
    @resize()

  bindEvents: ->
    $(window).on('resize', @resize)

  resize: =>
    @$el.css(minHeight: $(document).height() - 300)
    @$el.css(minHeight: $(document).height() - @top)


jQuery -> new Protoadmin.Layout.Content()
