class Protoadmin::StyleguideController < Protoadmin::ApplicationController

  def show
    render params[:view] || 'show'
  end

end
