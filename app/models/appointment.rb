class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, optional: true

acts_as_messageable

end
