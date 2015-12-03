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
  has_many :reviews
  has_many :watchlists

  validates :user_id, presence: true
end
