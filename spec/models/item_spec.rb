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

require 'spec_helper'
require 'rails_helper'

RSpec.describe Item, :type => :model do
 let(:item) {FactoryGirl.build(:item)}

   context 'when an item is invalid' do
      it 'is invalid without a name' do
       item.name = nil
       expect(item).to_not be_valid
     end
   end
   context 'when an item is invalid' do
      it 'is invalid without a description' do
       item.description = nil
       expect(item).to_not be_valid
     end
   end
   context 'when an item is invalid' do
      it 'is invalid without a condition id' do
       item.condition_id = nil
       expect(item).to_not be_valid
     end
   end


end
