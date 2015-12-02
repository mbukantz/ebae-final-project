# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  listing_id :integer
#  buyer_id   :integer
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sale < ActiveRecord::Base
  belongs_to :listing
  belongs_to :buyer
  has_one :seller, through: :listing
  has_one :item, through: :listing
end
