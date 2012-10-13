class Protoadmin::StyleguideController < Protoadmin::ApplicationController

  def show
    redirect_to protoadmin.styleguide_path(:forms)
  end

  private

  def add_crumbs
    add_crumb params[:action].titleize, protoadmin.styleguide_path(params[:action])
  end

end
