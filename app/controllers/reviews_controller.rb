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

  def summary
    @seller = Seller.find(params[:id])
    @buyer = Buyer.find(params[:id])
  end

  def show
    @review = Review.find(params[:id])
  end

end
