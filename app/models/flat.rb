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

  def display_main_image
    if self.images.first.nil?
      "http://floorplans.houseplansandmore.com/091D/091D-0400/091D-0400-front-main-8.jpg"
    else
      self.images.first.url
    end
  end
end
