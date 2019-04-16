class Posting < ApplicationRecord
  has_many :reviews, :notifications 
end
