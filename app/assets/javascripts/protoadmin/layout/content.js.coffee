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
    height = $(document).height()
    if @$el.height() < height - @top
      @$el.css(minHeight: height - 300)
      @$el.css(minHeight: height - @top)
    else
      @$el.css(minHeight: 'auto')

jQuery -> new Protoadmin.Layout.Content()
