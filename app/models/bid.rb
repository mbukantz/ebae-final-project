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

  validates :amount, presence: true
  validates :listing_id, presence: true
  validates :buyer_id, presence: true


  def update_listing_price
    if self.listing.highest_bidder == self.buyer.user
    elsif self.listing.bids.size >= 1 && (self.listing.highest_bid.amount + 1 < self.amount)
      self.listing.current_price = self.listing.highest_bid.amount + 1
    elsif self.listing.bids.empty?
      self.listing.current_price = self.listing.starting_price
    else
      self.listing.current_price = self.amount
    end
    self.listing.save
    self.save
  end

end
