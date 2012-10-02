Protoadmin.setup do |config|

  config.theme = :bootstrap
  config.layout  = [:search, :user_nav, :main_nav, :content]
  #config.modules = [:header, :search, :user_nav, :main_nav, :content]

  Devise.setup do |c|
    require 'devise/orm/active_record'

    c.router_name = :protoadmin
    c.parent_controller = 'Protoadmin::ApplicationController'
    c.mailer_sender = "admin@protoadmin.com"
    c.case_insensitive_keys = [:email]
    c.strip_whitespace_keys = [:email]
    c.skip_session_storage = [:http_auth]
    c.stretches = Rails.env.test? ? 1 : 10
    c.reconfirmable = true
    c.reset_password_within = 6.hours
    c.sign_out_via = :get
  end

  Navigasmic.setup do |c|
    c.semantic_navigation :protoadmin_main_nav do |n|
      n.item 'Dashboard', proc{ protoadmin.root_path }, icon: 'home'
      n.group 'Style Guide<span class="label">8</span>', icon: 'info-sign' do
        n.item 'Forms', proc{ protoadmin.styleguide_path('forms') }, icon: 'th-list'
        n.item 'Tables', proc{ protoadmin.styleguide_path('tables') }, icon: 'th'
        n.item 'Elements', proc{ protoadmin.styleguide_path('elements') }, icon: 'briefcase'
        n.item 'Messages', proc{ protoadmin.styleguide_path('messages') }, icon: 'warning-sign'
        n.item 'Icons', proc{ protoadmin.styleguide_path('icons') }, icon: 'list-ul'
        n.item 'Galleries', proc{ protoadmin.styleguide_path('galleries') }, icon: 'picture'
        n.item 'Maps', proc{ protoadmin.styleguide_path('maps') }, icon: 'map-marker'
        n.item 'Calendars', proc{ protoadmin.styleguide_path('calendars') }, icon: 'calendar'
      end
    end

    c.semantic_navigation :protoadmin_user_nav do |n|
      n.item n.t('protoadmin.user_nav.profile'), proc{ protoadmin.edit_admin_password_path }, class: 'btn', icon: 'user'
      n.item n.t('protoadmin.user_nav.settings'), '#', class: 'btn', icon: 'cog'
      n.item n.t('protoadmin.user_nav.sign_out'), proc{ protoadmin.destroy_admin_session_path }, class: 'btn', icon: 'share-alt'
    end
  end

  SimpleForm.setup do |c|
    c.default_wrapper = :bootstrap
    c.boolean_style = :nested
    c.button_class = 'btn'
    c.error_notification_tag = :div
    c.error_notification_class = 'alert alert-error'
    c.label_class = 'control-label'
    c.browser_validations = false
  end

end
