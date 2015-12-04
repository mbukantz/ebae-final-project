# == Schema Information
#
# Table name: buyers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Buyer < ActiveRecord::Base
  belongs_to :user
  has_many :sales
  has_many :reviews, through: :sales
  has_many :watchlists
  has_many :bids
  has_many :listings, through: :bids

  validates :user_id, presence: true

  def unique_listings
    listings.uniq
  end

  def feedback_received
    # self.reviews.select {|review| review.user_id != self.id}
    self.reviews.where("user_id != ?", self.user.id)
  end

end
