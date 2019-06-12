class FlatsController < ApplicationController
    def new
    @flat = Flat.new
    end

  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @reviews = Review.all
  end

  def create
    # @flat = Flat.find(params[:flat_id])
    # @booking = Booking.new(flat_params)
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

private

  def flat_params
    params.require(:flat).permit(:title, :descpription, :address, :price, :guests_nr, :photo)
  end
end
