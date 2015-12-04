class BidViewObject

  attr_reader :listing, :current_user

  def initialize(listing, current_user)
    @listing = listing
    @current_user = current_user
  end

  def can_create_invoice?
    listing.seller.user == current_user && listing.bids.size >= 1 && !listing.sale
  end
end