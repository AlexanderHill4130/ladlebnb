class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  validates :guests_nr, presence: true
end
