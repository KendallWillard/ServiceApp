class AppointmentsController < ApplicationController
  before_action :list_all_appointments, only: [:index, :show]
  before_action :list_all_services, only: [:index, :show]
  before_action :find_appointment, only: [:show]
  before_action :find_service_provider, only: [:show]
  before_action :find_homeowner, only: []



  def index
  end

  def show
    @appointment_id = @appointment.id
    photo_urls
  end

  def new
    find_service_prvider_services
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
    @service_provider = ServiceProvider.find(@appointment.service_provider_id)
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

  def find_service_prvider_services
    @services = ServiceProvider.find(params["format"]).services
  end

  def photo_urls
    @photo_urls = {
      "Framing" => "https://senaterace2012.com/wp-content/uploads/timber-framed-house-fenzel-pine-pinus-fenzelania_135638.jpg",
      "Concrete" => "https://www.thespruce.com/thmb/YgulnvON969WOzknPJmrgGy5cZI=/3865x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/residential-construction-site-foundation-walls-184391602-58a5ccf85f9b58a3c9ad94bb.jpg",
      "Plumbing" => "https://joesplumbingco.com/wp-content/uploads/2017/03/plumbing-tools.jpg",
      "Landscape" => "https://i.pinimg.com/originals/10/ba/15/10ba1504b763821d2ec94b8601d86e3e.jpg",
      "Electrical" => "https://st3.depositphotos.com/3261317/18924/i/1600/depositphotos_189248062-stock-photo-top-view-of-working-tools.jpg",
      "HVAC" => "https://hvacinds.com/wp-content/uploads/2017/12/grove-waltham-hvac-residential-project-1.jpg",
      "Painting" => "https://www.avrpainting.com/wp-content/uploads/2018/01/Painting-Services-miami-fl-Home-Service-residential-painting.png",
      "Sheetrock" => "https://firedawgsjunkremoval.com/images/Drywall-Sheetrock-Cleanup-Indianapolis-1200x900.jpg",
      "Flooring" => "https://www.phenixflooring.com/files/homepageslides/PhenixSliders-PPDesignSolutions4new.jpg",
      "Roofing" => "https://d3fgmcoixbear.cloudfront.net/s3fs-public/colors/308747-LM-MaxDefWeatheredWood.JPG",
      "Insulation" => "https://metalbuildinghomes.org/wp-content/uploads/2016/02/insulation-options-for-steel-buildings.jpg",
      "Cabinetry" => "https://www.durasupreme.com/sites/www.durasupreme.com/files/RaisedPanelDoors_2018-black.jpg",
      "Doors" => "https://bulgara-ny.com/img/door/wooden-door-types/27_various-types-of-residential-doors_doors-ppt.jpg",
      "Windows" => "http://www.davidmaudlin.com/ArchiCAD/DigitalArchitecture/ResLib/ResLib08W/ResLib08wGrilleTypes.gif",
      "Masonry" => "https://i.pinimg.com/736x/4b/46/01/4b4601b41b3622c5bebcf77a324b8456--architecture-details-architecture-drawings.jpg",
      "Stucco" => "https://thestuccoguy.com/wp-content/uploads/2013/07/Stucco-Textures-And-Finishes.jpg",
      "Siding" => "https://www.lavalleys.net/MainSite/Store1/_CachedContent/_ECommerce/StoreProductCategories/1040.jpg",
      "Fixtures and Finishes" => "https://s-media-cache-ak0.pinimg.com/736x/79/87/d2/7987d2174026233ba41a2559888066d4.jpg"
    }
  end


end
