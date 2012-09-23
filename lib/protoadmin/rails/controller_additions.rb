module Protoadmin::ControllerAdditions
  def self.included(base)
    #base.send(:helper_method, :proto)
  end

  def proto
    Protoadmin
  end
end
