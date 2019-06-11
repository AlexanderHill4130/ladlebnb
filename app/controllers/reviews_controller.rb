class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to booking_path(@booking)
    else
      @user = Booking.new
      render "users/show"
    end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
