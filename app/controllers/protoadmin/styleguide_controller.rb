class Protoadmin::StyleguideController < Protoadmin::ApplicationController

  before_filter :add_crumbs

  def show
    redirect_to protoadmin.styleguide_path(:forms)
  end

  def add_crumbs
    add_crumb params[:action].titleize, protoadmin.styleguide_path(params[:action])
  end

end
