# == Schema Information
#
# Table name: sellers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Seller < ActiveRecord::Base
  belongs_to :user
  has_many :sales, through: :listings
  has_many :reviews, through: :sales
  has_many :listings
  validates :user_id, presence: true

  def feedback_received
    # self.reviews.select {|review| review.user_id != self.id}
    self.reviews.where("user_id != ?", self.user.id)
  end

  def feedback_given
    self.reviews.where("user_id = ?", self.user.id)
    #tested and looks like it works
  end


end
