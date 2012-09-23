require 'spec_helper'

describe Protoadmin do

  it "is a module" do
    Protoadmin.should be_a(Module)
  end

  it "has a version" do
    Protoadmin::VERSION.should be_a(String)
  end

  it "defines ControllerAdditions" do
    Protoadmin::ControllerAdditions.should be_a(Module)
  end

  #it "includes ControllerAdditions in ActionController::Base" do
  #  ActionController::Base.new.methods.should include(:set_time_zone)
  #end

  it "defines ViewHelpers" do
    Protoadmin::ViewHelpers.should be_a(Module)
  end

  #it "includes ViewHelpers in ActionView::Base" do
  #  ActionView::Base::Base.new.methods.should include(:set_time_zone)
  #end

end
