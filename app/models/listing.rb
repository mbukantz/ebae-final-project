# == Schema Information
#
# Table name: listings
#
#  id             :integer          not null, primary key
#  item_id        :integer
#  starting_price :integer
#  current_price  :integer
#  shipping_price :integer
#  seller_id      :integer
#  start_time     :datetime
#  duration       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Listing < ActiveRecord::Base
  has_one :item
  belongs_to :seller
  has_many :watchlists
  has_many :bids
  accepts_nested_attributes_for :item

  def end_time
    start_time + duration.days
  end

  def time_left
    t = end_time - Time.now
    mm, ss = t.divmod(60)            #=> [4515, 21]
    hh, mm = mm.divmod(60)           #=> [75, 15]
    dd, hh = hh.divmod(24)           #=> [3, 3]
    "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]
  end

  def min_bid_amount
    if current_price
      current_price + 1
    else
      starting_price
    end
  end

  def highest_bid
    ordered_bids = self.bids.sort_by(&:amount)
    ordered_bids.reverse[0] if ordered_bids
    ##still need to handle use case where 2 users have same bid amount. earlier bid should take precedence
  end

  def highest_bidder
    if highest_bid
      highest_bid.buyer.user
    end
  end

end
