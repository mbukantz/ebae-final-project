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

require 'test_helper'

class CategoryItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
