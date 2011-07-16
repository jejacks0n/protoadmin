class Protoadmin::Navigation

  cattr_accessor :structure
  @@structure = ActiveSupport::OrderedHash.new # using this to retain support for ruby 1.8.7

  class << self

    def add
      yield self
    end

    def group(name, options = {})
      options[:html] = {:id => ''}
      if @@structure[name]
        @@structure[name][:options].merge(options)
      else
        @@structure[name] = {:options => options, :items => ActiveSupport::OrderedHash.new}
      end
      @@group = @@structure[name]
      yield if block_given?
    end

    def item(name, options = {})
      options[:html] = {:id => '', :class => options.delete(:class)}
      @@group[:items][name] = options
    end

  end

end