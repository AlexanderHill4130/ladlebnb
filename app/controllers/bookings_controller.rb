class BookingsController < ApplicationController
  def new
    @flat = Flat.find([:flat_id])
    @booking = Booking.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(flat_params)
    @booking.flat = @flat
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
    @reviews = @booking.reviews
  end

  def confirm_booking
    @booking = Booking.find(params[:id])
    @booking.status = "confirmed"
  end
  def deny_booking
    @booking = Booking.find(params[:id])
    @booking.status = "denied"
    #need to delete the booking
  end
  def pending_booking
    @booking = Booking.find(params[:id])
    @booking.status = "pending"
  end
  private

  def flat_params
    params.require(:booking).permit(:check_in, :check_out, :guests_nr)
  end
end
