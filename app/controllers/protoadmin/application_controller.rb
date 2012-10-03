class Protoadmin::ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :authenticate_admin!
  before_filter :add_base_crumbs

  layout :layout_for_devise_by_resource

  def dashboard
    render 'protoadmin/dashboard'
  end

  protected

  def add_base_crumbs
    controller_name = self.class.name.gsub(/Controller$/, '')
    unless controller_name == 'Protoadmin::Application'
      link = (controller_name =~ /Protoadmin/ ? protoadmin : self).url_for(controller: params[:controller])
      add_crumb controller_name.gsub(/Protoadmin::/, ''), link
    end
  end

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
