# == Schema Information
#
# Table name: sellers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


require 'spec_helper'
require 'rails_helper'

RSpec.describe Seller, :type => :model do
 let(:seller) {FactoryGirl.build(:seller, user_id: 1)}

 context 'when a seller is instantiated it must have a user_id' do
   it 'belongs to a user' do
     expect(seller.user_id).to_not be_nil
   end
 end

 context 'when a seller is invalid' do
    it 'is invalid without a user_id' do
     seller.user_id = nil
     expect(seller).to_not be_valid
   end
 end

end
