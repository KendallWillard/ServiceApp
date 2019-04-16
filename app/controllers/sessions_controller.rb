class SessionsController < ApplicationController

  def new

  end

  def create
    # byebug
    @homeowner = Homeowner.find_by(username: params[:user][:name])
    head(:forbidden) unless @homeowner.authenticate(params[:user][:password])
    session[:homeowner_id] = @homeowner.id
    render 'homeowners/show'
  end
end
