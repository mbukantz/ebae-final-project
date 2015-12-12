class BidViewObject

  attr_reader :listing, :current_user

  def initialize(listing, current_user)
    @listing = listing
    @current_user = current_user
  end

  def can_create_invoice?
    listing.seller.user == current_user && listing.bids.size >= 1 && !listing.sale
  end

  def won_auction?
    listing.sale && (current_user == listing.seller.user || current_user == listing.highest_bidder)
  end

  def display_amt(listing, amount)
    if listing.current_price
      amount / 100.0
    else
      0
    end
  end
end