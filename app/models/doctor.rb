class Doctor < ApplicationRecord
  has_many :users
  has_many :appointments
  acts_as_messageable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         def mailboxer_name
           self.name
         end

         def mailboxer_email(object)
           self.email
         end
end
