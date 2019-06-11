class ReviewsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    if @review.save
      redirect_to user_path(@user)
    else
      @user = Booking.new
      render "users/show"
    end
  end

  def new
    @review = Review.new
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
