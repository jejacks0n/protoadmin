class Protoadmin::ApplicationController < ActionController::Base

  protect_from_forgery

  layout :layout

  before_filter :authenticate_admin!, :add_base_crumbs, :add_crumbs, :create_body_class

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
    if self.class.name !~ /^Protoadmin::ApplicationController/
      link = (self.class.name =~ /^Protoadmin::/ ? protoadmin : self).url_for(controller: params[:controller])
      add_crumb controller_name.titleize, link
    end
  end

  def add_crumbs
  end

  def set_pjax_url
    super
    response.headers['X-PJAX-DATA'] = {
      body_class: "#{controller_name}_controller #{action_name}_action"
    }.to_json
  end

  def create_body_class
    @body_class = "#{controller_name}_controller #{action_name}_action"
  end

end
