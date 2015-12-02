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
end
