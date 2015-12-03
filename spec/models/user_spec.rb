# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  birthday        :datetime
#  password_digest :string
#  remember_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'
require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#valid?' do
    let(:user) { FactoryGirl.build(:user)}


    context 'when there is no last name' do
      it 'is invalid if there is no last name' do
        user.last_name = nil
        expect(user).to_not be_valid
      end
    end

    context 'when there is no first name' do
      it 'is invalid if there is no last name' do
        user.first_name = nil
        expect(user).to_not be_valid
      end
    end

    context 'when there is no email' do
      it 'is invalid if there is no email' do
        user.email = nil
        expect(user).to_not be_valid
      end
    end

    context 'when there is no birthday' do
      it 'is invalid if there is no birthday' do
        user.birthday = nil
        expect(user).to_not be_valid
      end
    end

    context 'when user is younger than 18' do
      it 'is invalid if user is younger than 18' do
        expect(user).to be_age
      end
    end
  end
end
