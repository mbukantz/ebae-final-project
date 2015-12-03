# == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  amount     :integer
#  listing_id :integer
#  buyer_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bid < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :listing 

  def update_listing_price
    if self.listing.highest_bid && (self.listing.highest_bid.amount + 1 < self.amount)
      self.listing.current_price = self.listing.highest_bid.amount + 1
    else
      self.listing.current_price = self.amount
    end
    self.listing.save
    self.save
  end

end
