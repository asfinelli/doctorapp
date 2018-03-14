class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, optional: true
  acts_as_messageable

private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Model.where(id: self.id).exists?
  end
end
