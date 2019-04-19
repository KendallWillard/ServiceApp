class PostingsController < ApplicationController

  before_action :find_posting, only: [:show, :update, :destroy]
  before_action :list_all_postings, only: [:index, :create, :update]
  before_action :find_appointment, only: [:show]
  before_action :find_service_provider, only: []

  def index
  end

  def show
  end

  def new
    @posting = Posting.new
    @@appointment = params[:appointment_id]
    @@homeowner_id = params[:homeowner_id]
  end

  def create
    @posting = Posting.create(posting_params)
    @posting.homeowner_id = @@homeowner_id
    if @posting.errors.any?
      render :new
    else
      # byebug
      @appointment_to_delete = Appointment.find(@@appointment)
      @appointment_to_delete.delete
      redirect_to service_provider_path(params[:service_provider_id].keys[0].split('{')[1].split('}')[0].split('>')[1].to_i)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def posting_params
    params.require(:posting).permit(:id, :title, :description, :before_image_url,
      :after_image_url, :start_date, :finish_date, :review_id, :homeowner_id, :notification_id,
      :created_at, :updated_at)
  end

  # def appointment_id_param
  #   params.require(:params).permit(:appointment_id)
  # end

  def find_posting
    @posting = Posting.find(params[:id])
  end

  def list_all_postings
    @postings = Posting.all
  end

  def find_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def find_service_provider
    @service_provider = ServiceProvider.find(@appointment.service_provider_id)
  end

end
