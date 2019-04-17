class ServiceProvidersService < ApplicationRecord
  belongs_to :service_provider
  belongs_to :service
end
