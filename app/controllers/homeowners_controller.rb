class HomeownersController < ApplicationController
  
  def index
    @homeowners = Homeowner.all
  end

  def new
    @homeowner = Homeowner.new
  end

  def create
    @homeowner = Homeowner.create(homeowner_params)
    if (@homeowner.errors.any?)
      render :new
    else
    redirect_to homeowners_path
    end
  end

  def show
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
                                      :city, :state, :zipcode, :email)
  end
end
