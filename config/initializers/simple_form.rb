SimpleForm.setup do |config|

  #config.wrappers :default, :class => :input,
  #  :hint_class => :field_with_hint, :error_class => :field_with_errors do |b|
  #
  #  b.use :html5
  #  b.use :placeholder
  #  b.optional :maxlength
  #  b.optional :pattern
  #  b.optional :min_max
  #  b.optional :readonly
  #
  #  b.use :label_input
  #  b.use :hint,  :wrap_with => { :tag => :span, :class => :hint }
  #  b.use :error, :wrap_with => { :tag => :span, :class => :error }
  #end

  config.wrappers :bootstrap, :tag => 'div', :class => 'control-group', :error_class => 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper :tag => 'div', :class => 'controls' do |ba|
      ba.use :input
      ba.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
      ba.use :hint,  :wrap_with => { :tag => 'p', :class => 'help-block' }
    end
  end

  config.wrappers :prepend, :tag => 'div', :class => "control-group", :error_class => 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper :tag => 'div', :class => 'controls' do |input|
      input.wrapper :tag => 'div', :class => 'input-prepend' do |prepend|
        prepend.use :input
      end
      input.use :hint,  :wrap_with => { :tag => 'span', :class => 'help-block' }
      input.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
    end
  end

  config.wrappers :append, :tag => 'div', :class => "control-group", :error_class => 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper :tag => 'div', :class => 'controls' do |input|
      input.wrapper :tag => 'div', :class => 'input-append' do |append|
        append.use :input
      end
      input.use :hint,  :wrap_with => { :tag => 'span', :class => 'help-block' }
      input.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
    end
  end

  config.wrappers :checkbox, :tag => 'div', :class => 'control-group', :error_class => 'error' do |b|
    b.wrapper :tag => 'div', :class => 'controls' do |ba|
      ba.use :label_input
    end
  end
end
