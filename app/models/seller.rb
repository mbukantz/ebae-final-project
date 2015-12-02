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
  has_many :reviews 
end
