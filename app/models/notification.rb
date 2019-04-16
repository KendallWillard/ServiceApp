class Notification < ApplicationRecord
  belongs_to :appointment, :service, :posting 

end
