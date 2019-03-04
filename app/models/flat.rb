class Flat < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
