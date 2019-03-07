class Flat < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :users, through: :reservations
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
end
