class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :profile_pic, PhotoUploader
  has_many :flats, dependent: :destroy
  has_many :reservations
  validates :name, presence: true
end
