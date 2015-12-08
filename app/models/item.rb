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
#  category_id  :integer
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

   def self.items_by_category
    category_count = Item.group(:category_id).count
     # => {1=>1, 4=>4, 5=>3, 7=>2} 
    category_count_with_names = Category.all.each_with_object({}) do | category_obj, category_count_hash|
      if category_count[category_obj.id]
        category_count_hash[category_obj.name] = category_count[category_obj.id]
      end
    end
    category_count_with_names.sort_by{|k, v| v}.reverse
  end
end
