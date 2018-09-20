class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:review][:product_id])
    review = Review.new(review_params)
    review.update(user_id: current_user.id)
    if review.save
      flash[:success] = "Your review was added!"
      redirect_to product_path(@product)
    else
    redirect_to product_path(@product)
    end
  end

  private
  def review_params
    params.require(:review).permit(:product_id, :content, :rating)
  end
end
