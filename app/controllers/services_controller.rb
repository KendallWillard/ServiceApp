class ServicesController < ApplicationController
  before_action :list_all_services, only: [:index]

  def index
  end

  def destroy
    @service = Service.find(params[:id])
    @service.delete

    redirect_to services_path
  end
  private

  def list_all_services
    @services = Service.all
  end

end
