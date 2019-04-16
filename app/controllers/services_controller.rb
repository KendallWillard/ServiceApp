class ServicesController < ApplicationController
  before_action :list_all_services, only: [:index]

  def index
  end


  private

  def list_all_services
    @services = Service.all
  end

end
