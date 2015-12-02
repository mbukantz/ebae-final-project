# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_one :buyer
  has_one :seller
  has_many :locations
  has_many :phones

  # Seller.create(user_id: self.id)
  # Buyer.create(user_id: self.id)

end
