# == Schema Information
#
# Table name: advanced_searches
#
#  id          :integer          not null, primary key
#  keywords    :string
#  category_id :integer
#  min_price   :integer
#  max_price   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :advanced_search do
    category_id 1
min_price 1
max_price 1
  end

end
