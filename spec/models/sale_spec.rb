# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  listing_id :integer
#  buyer_id   :integer
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


require 'spec_helper'
require 'rails_helper'

RSpec.describe Sale, :type => :model do
 let(:sale) {FactoryGirl.build(:sale)}
    context 'when a sale is invalid' do
      it 'is invalid without a listing id' do
       sale.listing_id = nil
       expect(sale).to_not be_valid
      end
    end
    context 'when a sale is invalid' do
      it 'is invalid without a buyer id' do
       sale.buyer_id = nil
       expect(sale).to_not be_valid
      end
    end
    context 'when a sale is invalid' do
      it 'is invalid without a price' do
       sale.price = nil
       expect(sale).to_not be_valid
      end
    end

    context '.highest_sale_price' do
      let(:sale) {FactoryGirl.build(:sale)}
      it 'finds the highest sale price of all time' do 
        sale.price = 500000
        expect(Sale.highest_sale_price.price).to eq(sale.price)
      end
    end

end
