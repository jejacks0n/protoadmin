class ProtoadminController < ActionController::Base

  protect_from_forgery

  self.responder = Protoadmin::Responder

end
