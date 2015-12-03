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
#  duration       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Listing < ActiveRecord::Base
  has_one :item
  belongs_to :seller
  has_many :watchlists
  accepts_nested_attributes_for :item

  validates :starting_price, presence: true
  validates :current_price, presence: true
  validates :shipping_price, presence: true
  validates :seller_id, presence: true
end
