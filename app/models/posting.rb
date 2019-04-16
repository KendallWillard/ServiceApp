class Posting < ApplicationRecord
  has_many :reviews
  has_many :notifications
  has_many :appointments, through: :notifications
  has_many :services, through: :notifications 
end
