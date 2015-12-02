# == Schema Information
#
# Table name: reviews
#
#  id             :integer          not null, primary key
#  transaction_id :integer
#  rating         :integer
#  comments       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Review < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
end
