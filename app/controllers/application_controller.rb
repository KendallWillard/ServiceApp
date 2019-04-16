class ApplicationController < ActionController::Base

  def current_user
    session[:homeowner_id]
  end
end
