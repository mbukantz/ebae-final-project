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
    if current_user.id == listing.sale.buyer_id
      review.user_id = listing.sale.buyer_id
    else
      review.user_id = listing.seller.user_id
    end
      review.comments = params[:review][:review][:comments]
      review.rating = params[:review][:review][:rating]
      review.sale_id = params[:sale_id]
    review.save
    redirect_to listing_sale_review_path(listing,sale,review)
  end

  def summary
    @user = User.find(params[:id])
    @seller = @user.seller
    @buyer = @user.buyer
  end

  def show
    @review = Review.find(params[:id])
  end

end
