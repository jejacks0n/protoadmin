Navigasmic.setup do |config|

  config.semantic_navigation :protoadmin_main_nav do |n|
    n.item 'Dashboard', proc{ protoadmin.root_path }, icon: 'home'
    n.group 'Form Elements<span class="label">3</span>', icon: 'th-list', id: 'form_elements_nav' do
      n.item 'Common Elements', '#'
      n.item 'Validation', '/posts'
      n.item 'Wizard', '#'
    end
    n.item 'Buttons &amp; Icons', '#', icon: 'tint'
    n.item 'Interface Elements', '#', icon: 'pencil'
    n.item 'Tables', '#', icon: 'th'
    n.item 'Grid Layout', '#', icon: 'th-list'
  end

  config.semantic_navigation :protoadmin_user_nav do |n|
    n.item n.t('protoadmin.user_nav.profile'), proc{ protoadmin.edit_admin_password_path }, class: 'btn btn-inverse', icon: 'user'
    n.item n.t('protoadmin.user_nav.settings'), '#', class: 'btn btn-inverse', icon: 'cog'
    n.item n.t('protoadmin.user_nav.sign_out'), proc{ protoadmin.destroy_admin_session_path }, class: 'btn btn-inverse', icon: 'share-alt'
  end

  config.builder main_nav: Navigasmic::Builder::ListBuilder do |builder|
    builder.wrapper_class = 'nav nav-list'

    builder.label_generator = proc do |label, options, has_link, has_nested|
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
