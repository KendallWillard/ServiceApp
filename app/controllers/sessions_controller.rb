class SessionsController < ApplicationController

  def new
  end

  def create
     # byebug
     # Boolean used to dictate whether or not to display user has entered incorrect
     # information
    if params[:user][:service_provider] == "0"
      # Homeowner login
      @homeowner = Homeowner.find_by(username: params[:user][:name])
      if @homeowner == NIL
        redirect_to '/login'
      else
        head(:forbidden) unless @homeowner.authenticate(params[:user][:password])
        session[:user_id] = @homeowner.id
        redirect_to homeowner_path(@homeowner)
      end
    else
      # Service Provider Login
      @service_provider = ServiceProvider.find_by(username: params[:user][:name])
      if @service_provider == NIL
        session[:incorrect_password] = true
        redirect_to '/login'
      else
        head(:forbidden) unless @service_provider.authenticate(params[:user][:password])
        session[:user_id] = @service_provider.id
        redirect_to service_provider_path(@service_provider)
        session.delete :incorrect_password
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end
end
