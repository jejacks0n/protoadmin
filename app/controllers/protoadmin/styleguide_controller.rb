class Protoadmin::StyleguideController < Protoadmin::ApplicationController

  #skip_authorization_check

  def show
    redirect_to protoadmin.styleguide_path(:forms)
  end

end
