class ApplicationController < ProtoadminController

  respond_to :html

  # todo: this is temporary and should eventually be removed
  def index
    render :action => params[:view], :layout => 'protoadmin'
  end

end
