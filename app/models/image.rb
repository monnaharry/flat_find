class Image < ApplicationRecord
  belongs_to :flat
  mount_uploader :url, PhotoUploader
  # after_create :try_default_image
  validates :url, presence: true

  # def try_default_image
  #   binding.pry
  #   if self.remote_url_url.nil?
  #     self.remote_url_url = "https://pmcvariety.files.wordpress.com/2018/07/bradybunchhouse_sc11.jpg?w=1000&h=563&crop=1"
  #     self.save
  #   end
  # end
end
