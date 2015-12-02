# == Schema Information
#
# Table name: category_items
#
#  id          :integer          not null, primary key
#  item_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CategoryItem < ActiveRecord::Base
  belongs_to :category
  belongs_to :item
end
