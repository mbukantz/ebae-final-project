# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  sale_id    :integer
#  rating     :integer
#  comments   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
require 'rails_helper'

RSpec.describe Review, :type => :model do
 let(:review) {FactoryGirl.build(:review)}
    context 'when a review is invalid' do
      it 'is invalid without a sale id' do
       review.sale_id = nil
       expect(review).to_not be_valid
     end
   end
   context 'when a review is invalid' do
      it 'is invalid without a rating' do
       review.rating = nil
       expect(review).to_not be_valid
     end
   end
     context 'when a review is invalid' do
        it 'is invalid without comments' do
         review.comments = nil
         expect(review).to_not be_valid
     end
   end
   context 'when a review is invalid' do
      it 'is invalid when comment is too short' do
       review.comments = "short"
       expect(review).to_not be_valid
   end
  end
end
