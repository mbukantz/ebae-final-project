class ReviewsController < ApplicationController

  def new
    @listing = Listing.find(params[:listing_id])
    @sale = Sale.find(params[:sale_id])
    @review = Review.new
  end

  def create
    review = Review.new
    sale = Sale.find(params[:sale_id])
    listing = Listing.find(params[:listing_id])
      review.user_id = listing.seller.user_id
      review.comments = params[:review][:review][:comments]
      review.rating = params[:review][:review][:rating]
      review.sale_id = params[:sale_id]
    review.save
    redirect_to listing_sale_review_path(listing,sale,review)
  end

  def index

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
    params.require(:review).permit(:listing_id, :sale_id,:review => [:rating, :comments])
  end


end
