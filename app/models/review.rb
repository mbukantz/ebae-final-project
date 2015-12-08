# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  sale_id    :integer
#  rating     :integer
#  comments   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ActiveRecord::Base
  belongs_to :sale
  belongs_to :user

  validates :sale_id, presence: true
  validates :rating, presence: true
  validates :comments, presence: true

end
