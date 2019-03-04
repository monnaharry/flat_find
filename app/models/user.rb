class User < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_many :reservations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
