class Protoadmin::ApplicationController < ActionController::Base

  protect_from_forgery

  layout :layout

  before_filter :authenticate_admin!, :add_base_crumbs, :add_crumbs

  def dashboard
    render 'protoadmin/dashboard'
  end

  private

  def layout
    return 'protoadmin/pjax' if pjax_request?
    return 'protoadmin/devise' if devise_controller?
    'protoadmin/application'
  end

  def add_base_crumbs
    return if devise_controller?
    controller_name = self.class.name.gsub(/Controller$/, '')
    unless controller_name == 'Protoadmin::Application'
      link = (controller_name =~ /Protoadmin/ ? protoadmin : self).url_for(controller: params[:controller])
      add_crumb controller_name.gsub(/Protoadmin::/, ''), link
    end
  end

  def add_crumbs
  end

end
