class Room < ApplicationRecord
  has_one_attached :icon
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :address, presence: true

  def icon_or_default
    icon.attached? ? icon : 'default_room.png'
  end
end
