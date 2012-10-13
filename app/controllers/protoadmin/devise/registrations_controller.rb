class Protoadmin::Devise::RegistrationsController < Devise::RegistrationsController

  include Pjax

  layout :layout

  before_filter :authenticate_admin!, :add_crumbs

  private

  def layout
    pjax_request? ? 'protoadmin/pjax' : 'protoadmin/application'
  end

  def add_crumbs
    add_crumb 'Profile', '#'
  end

  def self.mimes_for_respond_to
    {html: {}}
  end

end
