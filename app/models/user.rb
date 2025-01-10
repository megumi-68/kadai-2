class User < ApplicationRecord
  has_one_attached :icon
  has_many :rooms
  has_many :reservations
  
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def icon_or_default
    icon.attached? ? icon : 'default_icon.jpg'
  end
end
