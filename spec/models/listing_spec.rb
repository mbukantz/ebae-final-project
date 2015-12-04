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
#  end_time       :datetime
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

    context 'when a listing has watchers' do 
      let(:watchlist) {FactoryGirl.build(:watchlist)} 
      let(:listy){FactoryGirl.build(:listing, :id => 1)}
      it 'should return 2 when there are 2 watchers' do
        watchlist1 = watchlist 
        watchlist2 = watchlist 
        listy.watchlists << watchlist1
        listy.watchlists << watchlist2
        expect(listy.watchlist_total).to eq(2)
      end
    end
  end
end
