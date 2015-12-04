# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  street     :string
#  city       :string
#  state      :string
#  zip        :string
#  label      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  belongs_to :user
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  # validates :user_id, presence: true

end
