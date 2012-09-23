class ApplicationController < ActionController::Base

  def welcome
    render text: "Welcome"
  end

end
