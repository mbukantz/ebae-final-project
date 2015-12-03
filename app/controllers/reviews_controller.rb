class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    review = Review.create(review_params)
    review.sale_id = 6
    if review.save
      redirect_to reviews_path
    else
      redirect_to new_review_path
    end
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:sale_id, :rating, :comments)
  end


end
