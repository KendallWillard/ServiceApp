class Appointment < ApplicationRecord
  has_many :notifications
  has_many :services, through: :notifications
  has_one :review, through: :notifications 
end
