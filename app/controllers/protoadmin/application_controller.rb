class Protoadmin::ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :authenticate_admin!

  layout :layout_for_devise_by_resource

  def dashboard
    redirect_to new_admin_session_path unless admin_signed_in?
    render 'protoadmin/dashboard'
  end

  protected

  def layout_for_devise_by_resource
    if devise_controller?
      if resource_name == :admin
        'protoadmin_sign_in'
      else
        'application'
      end
    else
      'protoadmin'
    end
  end


end
