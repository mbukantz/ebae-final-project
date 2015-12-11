class BidHistoryViewObject
  # check if new bid is greater than current high bid or that the listing is greater than the current price
    # display buyer and bid

  attr_reader :listing, :bid

  def initialize(listing, bid)
    @listing = listing
    @bid = bid
  end

  def higher_than_cur_price?
    bid.amount > listing.highest_bid.amount || bid.amount > listing.current_price
  end

  def amount_to_display(amount)
    amount / 100.0
  end





end