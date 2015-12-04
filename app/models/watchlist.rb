# == Schema Information
#
# Table name: watchlists
#
#  id         :integer          not null, primary key
#  buyer_id   :integer
#  listing_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Watchlist < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :listing 


  def self.already_watching?(buyer_id, listing_id)
    watchlist = Watchlist.where("buyer_id = ? AND listing_id = ?", buyer_id, listing_id)
    watchlist.length > 0 ? true : false
  end

  def self.find_watchlist(buyer_id, listing_id)
    Watchlist.where("buyer_id = ? AND listing_id = ?", buyer_id, listing_id)
  end


end
