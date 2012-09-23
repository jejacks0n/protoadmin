require 'rails'

module Protoadmin
  class Engine < ::Rails::Engine

    initializer 'protoadmin.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end

    initializer 'protoadmin.controller_additions' do
      ActiveSupport.on_load(:action_controller) do
        include ControllerAdditions
      end
    end
  end
end
