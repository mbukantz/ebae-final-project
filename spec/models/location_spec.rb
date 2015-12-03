# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  street     :string
#  city       :string
#  state      :string
#  zip        :string
#  label      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


require 'spec_helper'
require 'rails_helper'
RSpec.describe Location, type: :model do
  describe '#valid?' do
    let(:location) { FactoryGirl.build(:location)}

    context 'when there is no street' do
      it 'is invalid if there is no street' do
        location.street = nil
        expect(location).to_not be_valid
      end
    end
    context 'when there is no city' do
      it 'is invalid if there is no city' do
        location.city = nil
        expect(location).to_not be_valid
      end
    end
    context 'when there is no state' do
      it 'is invalid if there is no state' do
        location.state = nil
        expect(location).to_not be_valid
      end
    end
    context 'when there is no zip' do
      it 'is invalid if there is no zip' do
        location.zip = nil
        expect(location).to_not be_valid
      end
    end
    context 'when there is no user_id' do
      it 'is invalid if there is no user_id' do
        location.user_id = nil
        expect(location).to_not be_valid
      end
    end
  end
end
