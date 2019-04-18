class NotificationsController < ApplicationController

  before_action :find_service_provider, only: [:index, :new, :create, :edit, :update]
  before_action :find_homeowner, only: [:index, :new, :create, :edit, :update]
  before_action :find_appointment, only: [:index, :new, :create, :edit, :update]
  before_action :find_notification, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.create(notification_params)
  end

  def edit
  end

  def update
    @notification.update
  end

  def destroy
  end

  private

  def find_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:id, :title, :description, :service_provider_id, :homeowner_id, :appointment_id)
  end

  def find_service_provider
    @service_provider = ServiceProvider.find(params[:service_provider_id])
  end

  def find_homeowner
    @homeowner = Homeowner.find(params[:homeowner_id])
  end

  def find_appointment
    @apointment = Appointment.find(params[:appointment_id])
  end

end
