class ApplicationController < Protoadmin::ApplicationController

  respond_to :html

  # todo: this is temporary and should eventually be removed
  def index
    render :action => params[:view]
  end

end
