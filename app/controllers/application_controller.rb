class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    render :action => params[:view], :layout => 'protoadmin'
  end
end
