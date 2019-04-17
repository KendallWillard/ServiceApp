class ApplicationController < ActionController::Base

  def current_user
    session[:homeowner_id]
    session[:chosen_service]
  end
end
