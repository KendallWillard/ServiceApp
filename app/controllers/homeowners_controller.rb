class HomeownersController < ApplicationController

  def index
    @homeowners = Homeowner.all
  end

  def new
    @homeowner = Homeowner.new
  end

  def create
    # Verify passwords match
    @verify_password = TRUE
    if params[:homeowner][:password] == params[:homeowner][:password_confirmation]
      @homeowner = Homeowner.create(homeowner_params)
      if (@homeowner.errors.any?)
        render :new
      else
        #Store the users information in the session hash
        @services = Service.all
        session[:user_id] = @homeowner.id
        redirect_to '/login'
      end
    else
      #the passwords did not match
      @verify_password = FALSE
      @homeowner = Homeowner.new
      render :new
    end
  end

  def show
    if session[:user_id] == params[:id].to_i && session[:homeowner_active] == TRUE
      @homeowner = Homeowner.find(session[:user_id])
      if(params[:search_term])
        redirect_to service_providers_path
      else
        find_homeowner_appointments
        @services = Service.all
      end
    elsif session[:homeowner_active] == FALSE
      redirect_to '/login'
    else
      redirect_to '/login'
    end

  end

  def edit
    @homeowner = Homeowner.find(params[:id])
  end

  def update
    @homeowner = Homeowner.update(homeowner_params)
      redirect_to homeowners_path
  end

  def destroy
    @homeowner = Homeowner.find(params[:id])
    @homeowner.delete

    redirect_to homeowners_path
  end

  private

  def homeowner_params
    params.require(:homeowner).permit(:first_name, :last_name, :street_name,
                                      :city, :state, :zipcode, :email, :username,
                                      :password, :password_confirmation)
  end

  def find_homeowner_appointments
    appointments_ordered = Appointment.order(:date).reverse
    @appointments = appointments_ordered.select do |appointment|
      appointment.homeowner_id == params[:id].to_i
    end
  end
end
