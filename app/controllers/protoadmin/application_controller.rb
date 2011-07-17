class Protoadmin::ApplicationController < ActionController::Base

  protect_from_forgery

  layout 'protoadmin'

  self.responder = Protoadmin::Responder

end
