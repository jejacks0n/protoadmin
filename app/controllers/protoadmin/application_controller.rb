class Protoadmin::ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :authenticate_admin!

  layout :layout_for_devise_by_resource

  def dashboard
    render 'protoadmin/dashboard'
  end

  protected

  def layout_for_devise_by_resource
    if devise_controller?
      if resource_name == :admin
        'protoadmin/devise'
      else
        'application'
      end
    else
      'protoadmin/application'
    end
  end

end
