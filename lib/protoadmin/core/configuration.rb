require 'singleton'

module Protoadmin
  class Configuration
    include Singleton

    cattr_accessor :layout
    @@layout = [:header, :search, :user_nav, :main_nav, :content]
  end

  mattr_accessor :configuration
  @@configuration = Configuration

  def self.setup
    yield @@configuration
  end
end
