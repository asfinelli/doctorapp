class User < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments
  acts_as_messageable
  before_save :capitalize_names
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def capitalize_names
    self.name = name.camelcase
  end
  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
