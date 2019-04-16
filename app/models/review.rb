class Review < ApplicationRecord
  belongs_to :homeowner
  belongs_to :posting
end
