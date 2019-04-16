class ServiceProvidersController < ApplicationController
  has_and_belongs_to_many :services
end
