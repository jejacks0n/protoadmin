module Protoadmin::Config

  class << self

    def setup
      yield self
    end

    def add_navigation(&block)
      Protoadmin::Navigation.add(&block)
    end

  end

end
