class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_many :reviews
  validates :guests_nr, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :check_in, :check_out, presence: true
  validate :out_greater_than_in

  validate :guest_max

private
  def out_greater_than_in
    return if check_out.blank? || check_in.blank?
    if check_out < check_in
      errors.add(:check_out, "must be after the start date")
    end
  end
#need to fix the datepicker for booking in the past
  def no_past
    if check_in < Date.now
      errors.add(:check_in, "You can not book in the past")
    end
  end
  def guest_max
    if guests_nr > flat.guests_nr
    errors.add(:guests_nr, "Not enough space for everybody,sorry!")
    end
  end
end
