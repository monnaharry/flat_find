class Image < ApplicationRecord
  belongs_to :flat
  mount_uploader :url, PhotoUploader
end
