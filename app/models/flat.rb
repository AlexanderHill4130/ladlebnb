class Flat < ApplicationRecord
  has_many :bookings
  belongs_to :user

  mount_uploader :photo, PhotoUploader

end
