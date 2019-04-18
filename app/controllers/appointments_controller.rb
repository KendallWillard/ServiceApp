class AppointmentsController < ApplicationController
  before_action :list_all_appointments, only: [:index, :show]
  before_action :list_all_services, only: [:index, :show, :new]
  before_action :find_appointment, only: [:show]
  before_action :find_service_provider, only: []
  before_action :find_homeowner, only: []



  def index
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create(appointment_params)
    redirect_to homeowner_path(@appointment.homeowner_id)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:id, :date, :time, :notification_id, :description,
    :service_id, :service_provider_id, :homeowner_id)
  end

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def find_service_provider
    @service_provider = ServiceProvider.find(params[:service_provider_id])
  end

  def find_homeowner
    @homeowner = Homeowner.find(params[:homeowner_id])
  end

  def list_all_appointments
    @appointments = Appointment.all
  end

  def list_all_services
    @services = Service.all
  end


end
