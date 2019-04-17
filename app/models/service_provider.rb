class ServiceProvider < ApplicationRecord
  has_and_belongs_to_many :services
  has_secure_password
end
