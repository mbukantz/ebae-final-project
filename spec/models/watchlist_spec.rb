# == Schema Information
#
# Table name: watchlists
#
#  id         :integer          not null, primary key
#  buyer_id   :integer
#  listing_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
require 'rails_helper'

RSpec.describe Watchlist, :type => :model do
  let(:watchlist) {Watchlist.create(buyer_id: 1, listing_id: 1)}

   context 'when a buyer is already watching a listing' do
      it 'already_watched? returns true' do
        new_watchlist = watchlist
        expect(Watchlist.already_watched?(1, 1)).to eq(true)
     end
   end

   context 'when a buyer is not watching a listing yet' do 
      it 'already_watched? returns false' do
        buyer_id = 2
        new_watchlist = watchlist
        expect(Watchlist.already_watched?(buyer_id, new_watchlist.listing_id))
      end
   end

  context 'when a buyer wants to unwatch an item' do
    it 'find_watchlist returns an instance of Watchlist' do 
      new_watchlist = watchlist
      retrieved_watchlist = Watchlist.find_watchlist(new_watchlist.buyer_id, new_watchlist.listing_id)
      retrieved_watchlist = retrieved_watchlist.first
      expect(retrieved_watchlist).to be_kind_of(Watchlist)
    end 
  end



end
