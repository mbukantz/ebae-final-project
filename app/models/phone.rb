# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  number     :string
#  type       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Phone < ActiveRecord::Base
  belongs_to :user

  validates :number, presence: true
  # validates :label, presence: true
  # validates :user_id, presence: true
end
