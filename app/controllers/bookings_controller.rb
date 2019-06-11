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
      redirect_to flat_booking_path(@flat,@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @reviews = @booking.reviews
  end

  private

  def flat_params
    params.require(:booking).permit(:check_in, :check_out, :guests_nr)
  end
end
