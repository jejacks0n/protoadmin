require 'spec_helper'

describe Protoadmin do

  it "is a module" do
    Protoadmin.should be_a(Module)
  end

  it "has a version" do
    Protoadmin::VERSION.should be_a(String)
  end

end
