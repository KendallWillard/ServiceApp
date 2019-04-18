class AppointmentsController < ApplicationController
  before_action :find_homeowner, only: [:index, :new]
  before_action :list_all_appointments, only: [:index]
  before_action :list_all_services, only: [:new]

  def index
  end

  def new
    @services = Service.all
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create(appointment_params)
    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :notification_id, :description,
    :service_id, :service_provider_id, :homeowner_id, :service_provider_id)
  end

  def find_homeowner
    @homeowner = Homeowner.find(session[:user_id])
  end

  def list_all_appointments
    @appointments = Appointment.all
  end

  def list_all_services
    @services = Service.all
  end


end
