class ServiceProvidersController < ApplicationController
  before_action :list_all_service_providers, only: [:index]
  before_action :list_all_services, only: [:index, :new, :create]
  before_action :find_service_provider, only: [:show, :edit, :destroy]
  before_action :find_service_provider_postings, only: [:show]
  before_action :find_service_provider_appointments, only: [:show]

  def index
    if params[:format]
      @service = Service.find(params[:format])
    elsif params[:search_term]
      @service_providers = ServiceProvider.where("name LIKE ?", "%#{params[:search_term]}%")
    end
    @service ? @filter_results = true : @filter_results = false
  end

  def show
  end

  def new
    @service_provider = ServiceProvider.new
  end

  def create
    @verify_password = true
    if params[:service_provider][:password] == params[:service_provider][:password_confirmation]
      @service_provider = ServiceProvider.create(service_provider_params)
      if @service_provider.errors.any?
        render :new
      else
        @postings = Posting.all
        session[:homeowner_active] = FALSE
        session[:user_id] = @service_provider.id
        render :show
      end
    end
  end

  def edit
  end

  def update
    @service_provider = ServiceProvider.find(service_provider_params)
    @service_provider.update
  end

  def destroy
    @service_provider = ServiceProvider.find(params[:id])
    @service_provider.delete

    redirect_to service_providers_path
  end

  private

  def service_provider_params
    params.require(:service_provider).permit(:id, :service_provider_type, :name, :street_name, :city,
      :state, :zipcode, :service_area, :years_in_service, :average_rating, :username, :password, :password_confirmation,
      service_ids:[])
  end

  def find_service_provider
    @service_provider = ServiceProvider.find(params[:id])
  end

  def list_all_services
    @services = Service.all
  end

  def list_all_service_providers
    @service_providers = ServiceProvider.all
  end

  def find_service_provider_postings
    @postings = Posting.select(params[:service_provider_id])
  end

  def find_service_provider_appointments
    appointments_ordered = Appointment.order(:date).reverse
    @appointments = appointments_ordered.select do |appointment|
      appointment.service_provider_id == params[:id].to_i
    end
  end

end
