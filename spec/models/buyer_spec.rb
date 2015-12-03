require 'spec_helper'
require 'rails_helper'

RSpec.describe Buyer, :type => :model do
 let(:buyer) {FactoryGirl.build(:buyer, user_id: 1)}

 context 'when a buyer is instantiated it must have a user_id' do
   it 'belongs to a user' do
     expect(buyer.user_id).to_not be_nil
   end
 end

 context 'when a buyer is invalid' do
    it 'is invalid without a user_id' do
     buyer.user_id = nil
     expect(buyer).to_not be_valid
   end
 end

end
