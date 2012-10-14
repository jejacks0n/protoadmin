module Protoadmin::Modules::WidgetBoxHelpers

  def widget_box(options = {}, &block)
    add_crumb(options[:title], '#') if options.delete(:crumb)

    options[:class] = options[:class] ? "#{options[:class]} widget-box" : 'widget-box'

    if options[:icon] == :checkbox
      options[:icon] = content_tag(:input, '', type: 'checkbox')
    elsif options[:icon].present?
      options[:icon] = content_tag(:i, '', class: "icon-#{options[:icon]}")
    end

    if options[:label].is_a?(Hash)
      labels = options[:label].map { |key, value| content_tag(:span, value, class: "label label-#{key}") }
      options[:label] = labels.join('').html_safe
    elsif options[:label].present?
      options[:label] = content_tag(:span, options[:label], class: 'label')
    end

    locals = {content: capture(&block), title: options.delete(:title), icon: options.delete(:icon), label: options.delete(:label)}
    content_tag(:div, render(partial: 'protoadmin/modules/widget_box', locals: locals), options)
  end

end
