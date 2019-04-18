class SessionsController < ApplicationController

  def new
  end

  def create
     # byebug
     # Boolean used to dictate whether or not to display user has entered incorrect
     # information
     session.delete :incorrect_password
    if params[:user][:service_provider] == "0"
      # Homeowner login
      session[:homeowner_active] = true
      @homeowner = Homeowner.find_by(username: params[:user][:name])
      # THIS CHECK for NIL must happen FIRST or else is homeowner is nil and it trys
      # to authenticate it will throw an error
      if @homeowner != NIL && @homeowner.authenticate(params[:user][:password])
        session[:user_id] = @homeowner.id
        session[:homeowner_active] = TRUE
        redirect_to homeowner_path(@homeowner)
      else
        session[:incorrect_password] = true
        redirect_to '/login'
      end


    else
      # Service Provider Login
      session[:homeowner_active] = false
      @service_provider = ServiceProvider.find_by(username: params[:user][:name])
      # THIS CHECK for NIL must happen FIRST or else is service provider is nil and it
      # tries to authenticate it will throw an error
      if @service_provider != NIL && @service_provider.authenticate(params[:user][:password])
        session[:user_id] = @service_provider.id
        redirect_to service_provider_path(@service_provider)
      else
        session[:incorrect_password] = true
        redirect_to '/login'
      end
    end
  end

  def destroy
    session.delete :user_id
    session.delete :incorrect_password
    session.delete :homeowner_active
    redirect_to '/login'
  end
end
