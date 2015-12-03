# == Schema Information
#
# Table name: listings
#
#  id             :integer          not null, primary key
#  starting_price :integer
#  current_price  :integer
#  shipping_price :integer
#  seller_id      :integer
#  start_time     :datetime
#  duration       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#



require 'spec_helper'
require 'rails_helper'
RSpec.describe Listing, type: :model do
  describe '#valid?' do
    let(:listing) { FactoryGirl.build(:listing)}

    context 'when there is no starting price' do
      it 'is invalid if there is no starting price' do
        listing.starting_price = nil
        expect(listing).to_not be_valid
      end
    end


    context 'when there is no shipping price' do
      it 'is invalid if there is no shipping price' do
        listing.shipping_price = nil
        expect(listing).to_not be_valid
      end
    end

    context 'when there is no seller id' do
      it 'is invalid if there is no seller id' do
        listing.seller_id = nil
        expect(listing).to_not be_valid
      end
    end
  end
end
