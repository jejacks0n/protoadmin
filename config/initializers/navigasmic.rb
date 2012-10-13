Navigasmic.setup do |config|

  config.builder main_nav: Navigasmic::Builder::ListBuilder do |builder|
    builder.wrapper_class = 'nav nav-list'

    builder.label_generator = proc do |label, options, has_link, has_nested|
      label << "<span class='label'>#{options.delete(:label)}</span>".html_safe if options.has_key?(:label)
      if !has_nested || has_link
        label = "<span class='text'>#{label}</span>"
        options.has_key?(:icon) ? "<i class='icon icon-#{options.delete(:icon)}'></i>#{label}".html_safe : label
      else
        icon = options.has_key?(:icon) ? "<i class='icon icon-#{options.delete(:icon)}'></i>".html_safe : ''
        link_to("#{icon}<span class='text'>#{label}</span>".html_safe, 'javascript:void(0)', class: 'subnav')
      end
    end

    builder.link_generator = proc do |label, link, link_options, has_nested|
      if has_nested
        link = '#'
        label << "<b class='caret'></b>".html_safe
        options.merge!(class: 'dropdown-toggle', data: {toggle: 'dropdown'})
      end
      link_to(label, link, link_options)
    end
  end

  config.builder user_nav: Navigasmic::Builder::ListBuilder do |builder|
    builder.wrapper_class = 'nav btn-group'
    builder.has_nested_class = 'dropdown'
    builder.is_nested_class = 'dropdown-menu'

    builder.label_generator = proc do |label, options, has_link, has_nested|
      if !has_nested || has_link
        label = "<span class='text'>#{label}</span>"
        options.has_key?(:icon) ? "<i class='icon icon-#{options.delete(:icon)}'></i> #{label}".html_safe : label
      else
        icon = options.has_key?(:icon) ? "<i class='icon icon-#{options.delete(:icon)}'></i>".html_safe : ''
        link_to("#{icon}<span class='text'>#{label}</span>&nbsp;<b class='caret'></b>".html_safe, '#', class: 'dropdown-toggle', data: {toggle: 'dropdown'})
      end
    end

    builder.link_generator = proc do |label, link, link_options, has_nested|
      if has_nested
        link = '#'
        label << "<b class='caret'></b>".html_safe
        options.merge!(class: 'dropdown-toggle', data: {toggle: 'dropdown'})
      end
      link_to(label, link, link_options)
    end
  end

end
