class Appointment < ApplicationRecord
  has_many :notifications 
end
