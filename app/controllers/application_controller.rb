class ApplicationController < ActionController::Base

  def current_user
    session[:user_id]
    session[:incorrect_password]
  end
end
