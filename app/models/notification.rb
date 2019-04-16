class Notification < ApplicationRecord
  belongs_to :appointment
  belongs_to :service
  belongs_to :posting 

end
