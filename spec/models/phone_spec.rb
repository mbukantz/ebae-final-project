require 'spec_helper'
require 'rails_helper'

RSpec.describe Phone, :type => :model do
 let(:phone) {FactoryGirl.build(:phone)}

   context 'when a phone is invalid' do
      it 'is invalid without a number' do
       phone.number = nil
       expect(phone).to_not be_valid
     end
   end
  #  context 'when a phone is invalid' do
  #     it 'is invalid without a label' do
  #      phone.label = nil
  #      expect(phone).to_not be_valid
  #    end
  #  end
   context 'when a phone is invalid' do
      it 'is invalid without a user id' do
       phone.user_id = nil
       expect(phone).to_not be_valid
     end
   end
end
