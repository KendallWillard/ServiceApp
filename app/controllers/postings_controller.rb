class PostingsController < ApplicationController

  before_action :find_posting, only: [:show, :update, :destroy]
  before_action :list_all_postings, only: [:index, :create, :update]
  before_action :find_appointment, only: [:show, :create]

  def index
  end

  def show
  end

  def new
    @posting = Posting.new
  end

  def create
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

  def find_posting
    @posting = Posting.find(params[:id])
  end

  def list_all_postings
    @postings = Posting.all
  end

  def find_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

end
