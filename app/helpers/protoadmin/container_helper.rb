module Protoadmin::ContainerHelper

  def container(options = {}, &block)
    buffer = ''
    buffer << content_tag(:h1, options.delete(:title), :class => 'title') if options[:title]
    buffer << content_tag(:article, capture(&block))

    options[:class] = add_html_class(options[:class], 'container')
    content_tag(:section, buffer.html_safe, options)
  end

end