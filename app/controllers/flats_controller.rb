class FlatsController < ApplicationController
  def home
    @flats = Flat.all
  end

  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end
end
