class HomeownersController < ApplicationController

  def index
    @homeowners = Homeowner.all
  end

  def new
    @homeowner = Homeowner.new
  end

  def create
    # Verify passwords match
    @verify_password = true
    if params[:homeowner][:password] == params[:homeowner][:password_confirmation]
      @homeowner = Homeowner.create(homeowner_params)
      if (@homeowner.errors.any?)
        render :new
      else
        #Store the users information in the session hash
        @services = Service.all
        session[:homeowner_id] = @homeowner.id
        render :show
      end
    else
      #the passwords did not match
      @verify_password = false
      @homeowner = Homeowner.new
      render :new
    end
  end

  def show
    return head(:forbidden) unless session.include? :homeowner_id
    @services = Service.all
    @homeowner = Homeowner.find(params[:id])

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
end
