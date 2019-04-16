class Service < ApplicationRecord
  has_and_belongs_to_many :service_providers
  has_many :notifications
  has_many :appointments, through: :notifications
  has_many :postings, through: :notifications
end
