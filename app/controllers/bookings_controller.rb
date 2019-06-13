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

  def update
    @booking = Booking.find(params[:id])
    @booking.status = params["booking"]["status"]
    @booking.save
  end

  private

  def flat_params
    params.require(:booking).permit(:check_in, :check_out, :guests_nr, :status)
  end
end
