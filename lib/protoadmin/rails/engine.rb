require 'rails'

module Protoadmin
  class Engine < ::Rails::Engine
    engine_name 'protoadmin'

    initializer "protoadmin.controllers" do
      ActiveSupport.on_load :action_controller do
        ActionController::Base.send :include, Pjax
      end
    end

    initializer "protoadmin.view_helpers" do
      ActiveSupport.on_load :action_controller do
        helper Protoadmin::ModuleHelpers
      end
    end

  end
end
