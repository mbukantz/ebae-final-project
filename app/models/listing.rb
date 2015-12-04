# == Schema Information
#
# Table name: listings
#
#  id             :integer          not null, primary key
#  starting_price :integer
#  current_price  :integer
#  shipping_price :integer
#  seller_id      :integer
#  start_time     :datetime
#  end_time       :datetime
#  duration       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Listing < ActiveRecord::Base
  has_one :item
  belongs_to :seller
  has_many :watchlists
  has_many :bids
  has_one :sale
  accepts_nested_attributes_for :item

  validates :starting_price, presence: true
  validates :shipping_price, presence: true
  validates :seller_id, presence: true

  def self.active
    Listing.where('end_time > ?', Time.now)
  end

  def self.inactive
    Listing.where('end_time < ?', Time.now)
  end

  def active?
    self.end_time > Time.now
  end

  def inactive?
    self.end_time < Time.now
  end

  def time_left
    if self.active?
      t = end_time - Time.now
      mm, ss = t.divmod(60)            #=> [4515, 21]
      hh, mm = mm.divmod(60)           #=> [75, 15]
      dd, hh = hh.divmod(24)           #=> [3, 3]
      "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]
    else
      "Ended"
    end
  end

  def min_bid_amount
    if current_price
      current_price + 1
    else
      starting_price
    end
  end

  def highest_bid_by_user(user)
    self.bids.where(buyer_id: user.buyer.id).max_by(&:amount)
  end

  def highest_bid
    # ordered_bids = self.bids.sort_by(&:amount)
    # ordered_bids.reverse[0] if ordered_bids
    if self.bids.present?
      highest_bids = self.bids.group_by(&:amount).max.last
      if highest_bids.size == 1
        highest_bids.first
      else
        highest_bids.sort_by(&:created_at).first
      end
    else
      nil
    end
  end

  def highest_bidder
    if highest_bid
      highest_bid.buyer.user
    end
  end

  def watchlist_total
    self.watchlists.length
  end


end
