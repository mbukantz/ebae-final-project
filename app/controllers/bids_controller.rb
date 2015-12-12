class BidsController < ApplicationController

  def create
    bid = Bid.new(bid_params)
    bid.amount = (bid_params[:amount].to_f * 100).to_i
    bid.buyer = current_user.buyer
    listing = Listing.find(bid_params[:listing_id])
    if bid.update_listing_price && request.xhr?
      auction_snapshot_update = render_to_string('listings/_auction_snapshot.html.erb', locals: {listing: listing, layout: false})
      bid_history_update = render_to_string('listings/_bid_history_single_row.html.erb', locals: {listing: listing, bid: bid}, layout: false)
      render json: {auction_snapshot: auction_snapshot_update, bid_history: bid_history_update}
    elsif bid.update_listing_price
      redirect_to listing_path(listing)
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :listing_id)
  end

end
