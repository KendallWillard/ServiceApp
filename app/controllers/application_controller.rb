class ApplicationController < ActionController::Base

  def current_user
    session[:homeowner_id]
    session[:incorrect_password]
    session[:chosen_service]
  end
end
