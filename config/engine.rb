require "rails"

module ProtoAdmin
  class Engine < Rails::Engine

    # Template engines.
    config.app_generators do |g|
      g.template_engine :haml
    end

    # Default encoding used.
    config.encoding = 'utf-8'

    # View paths so layouts and views can be used.
    initializer 'protosite.add_paths' do |app|
      app.paths.app.views.push "#{root}/app/views"
    end

    # Base navigation that can be added to from plugins and the application.
    config.to_prepare do
      #ProtoAdmin::Navigation.add do |n|
      #
      #  n.group 'Dashboard' do
      #    n.item 'Overview', :link => {:controller => 'dashboard', :action => :show}, :highlights_on => {:controller => 'dashboard'}
      #  end
      #
      #end
    end

  end
end
