class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_many :reviews
  validates :guests_nr, presence: true
end
