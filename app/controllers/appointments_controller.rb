class AppointmentsController < ApplicationController
  before_action :list_all_appointments, only: [:index]

  def index
  end

  def new
    service_provider = ServiceProvider.find(params["format"])
    @services = service_provider.services.all
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create(appointment_params)
    redirect_to homeowner_path(@appointment.homeowner_id)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :notification_id, :description,
    :service_id, :service_provider_id, :homeowner_id, :service_provider_id)
  end



  def list_all_appointments
    @appointments = Appointment.all
  end

  def list_all_services
    @services = Service.all
  end


end
