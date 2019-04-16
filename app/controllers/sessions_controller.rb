class SessionsController < ApplicationController

  def new

  end

  def create
    # byebug
    @homeowner = Homeowner.find_by(username: params[:user][:name])
    return head(:forbidden) unless @homeowner.authenticate(params[:user][:password])
    session[:homeowner_id] = @homeowner.id
    redirect_to homeowner_path(@homeowner)
  end

  def destroy
    session.delete :username
    redirect_to '/login'
  end
end
