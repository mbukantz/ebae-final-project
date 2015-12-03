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

require 'spec_helper'
require 'rails_helper'

RSpec.describe CategoryItem, :type => :model do
 let(:category_item) {FactoryGirl.build(:category_item)}

   context 'when a category_item is invalid' do
      it 'is invalid without a category_id' do
       category_item.category_id = nil
       expect(category_item).to_not be_valid
     end
   end
   context 'when a category_item is invalid' do
      it 'is invalid without a item_id' do
       category_item.item_id = nil
       expect(category_item).to_not be_valid
     end
   end
end
