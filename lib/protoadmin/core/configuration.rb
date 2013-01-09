require 'singleton'

module Protoadmin
  class Configuration
    include Singleton

    cattr_accessor :theme, :layout, :devise_model, :parent_controller

    @@theme = :light
    @@layout = [:header, :search, :user_nav, :main_nav, :content]
    @@devise_model = :admin
    @@parent_controller = 'ActionController::Base'
  end

  mattr_accessor :configuration
  @@configuration = Configuration

  def self.setup
    yield @@configuration
  end
end
