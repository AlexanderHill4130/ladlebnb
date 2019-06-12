class DashboardsController < ApplicationController

  def index
    @user_bookings = Booking.where(user: current_user)
    if current_user.host
      @received_bookings = current_user.get_user_received_bookings
    end
  end

end
