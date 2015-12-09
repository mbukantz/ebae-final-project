# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :items
  has_many :listings, through: :items

  validates :name, presence: name

  def active_items
    self.items.joins(:listing).where('end_time > ?', Time.now)
  end

end
