class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :address, presence: true
end
