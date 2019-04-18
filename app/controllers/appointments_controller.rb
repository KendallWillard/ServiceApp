class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
    @homeowner = Homeowner.find(session[:homeowner_id])

  end

  def new
    @services = Service.all
    @appointment = Appointment.new
    @homeowner = Homeowner.find(session[:user_id])
  end

  def create
    @appointment = Appointment.create(appointment_params)
    redirect_to appointments_path
  end



  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :notifications_id, :description,
    :services_id, :service_providers_id, :homeowners_id)
  end
end
