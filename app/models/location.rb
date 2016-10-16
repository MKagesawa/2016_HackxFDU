class Location < ApplicationRecord
  geocoded_by :id
  after_validation :geocode
  # mount_uploader :avatar, AvatarUploader
  belongs_to :user
end
