class BidsController < ApplicationController

  def create
    bid = Bid.new(bid_params)
    bid.amount = (bid_params[:amount].to_f * 100).to_i
    bid.buyer = current_user.buyer
    listing = Listing.find(bid_params[:listing_id])
    if bid.update_listing_price
      redirect_to listing_path(listing)
    else

    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :listing_id)
  end

end
