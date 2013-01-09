class Protoadmin::Devise::RegistrationsController < Devise::RegistrationsController

  #skip_authorization_check

  include Pjax

  layout :layout

  before_filter :authenticate!

  private

  def authenticate!
    self.send("authenticate_#{Protoadmin.configuration.devise_model}!")
  end

  def layout
    pjax_request? ? 'protoadmin/pjax' : 'protoadmin/application'
  end

  def self.mimes_for_respond_to
    {html: {}}
  end

end
