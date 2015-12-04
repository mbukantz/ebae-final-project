# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :string
#  picture_url  :string
#  condition_id :integer
#  listing_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :condition
  belongs_to :listing

  validates :name, presence: true
  validates :description, presence: true
  validates :condition_id, presence: true

  def self.all_by_category?(category)
    Item.where("category_id = ?", category.id)
  end
end
