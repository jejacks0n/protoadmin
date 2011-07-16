require "rails"

module Protoadmin
  class Engine < Rails::Engine

    # Template engines.
    config.app_generators do |g|
      g.template_engine :haml
    end

    # Default encoding used.
    config.encoding = 'utf-8'

    initializer 'protoadmin.add_paths' do |app|
      # View paths so layouts and views can be used.
      app.paths["#{root}/app/views"]

      # Autoload paths.
      config.autoload_paths += %W( #{root}/lib/protoadmin )
    end

    # Add better handling for I18n
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{yml,rb}')]

    # Base navigation that can be added to from plugins and the application.
    config.to_prepare do
      #Protoadmin::Navigation.add do |n|
      #
      #  n.group 'Dashboard' do
      #    n.item 'Overview', :link => {:controller => 'dashboard', :action => :show}, :highlights_on => {:controller => 'dashboard'}
      #  end
      #
      #end
    end

  end
end
