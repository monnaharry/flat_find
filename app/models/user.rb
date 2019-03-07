class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :profile_pic, PhotoUploader
  has_many :flats, dependent: :destroy
  has_many :reservations, dependent: :destroy
  validates :name, presence: true
  after_create :adding_default_avatar

  def adding_default_avatar
    self.remote_profile_pic_url = "https://www.drupal.org/files/issues/default-avatar.png"
    self.save
  end
end
