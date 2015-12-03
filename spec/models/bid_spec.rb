# == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  amount     :integer
#  listing_id :integer
#  buyer_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
require 'rails_helper'

RSpec.describe Bid, :type => :model do
 let(:bid) {FactoryGirl.build(:bid)}

   context 'when a bid is invalid' do
      it 'is invalid without an amount' do
       bid.amount = nil
       expect(bid).to_not be_valid
     end
   end

   context 'when a bid is invalid' do
      it 'is invalid without an listing_id' do
       bid.listing_id = nil
       expect(bid).to_not be_valid
     end
   end
   context 'when a bid is invalid' do
      it 'is invalid without a buyer_id' do
       bid.buyer_id = nil
       expect(bid).to_not be_valid
     end
   end
end
