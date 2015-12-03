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
RSpec.describe User, type: :model do
  describe '#valid?' do
    let(:user) { FactoryGirl.build(:user, first_name: firstname) }
    let(:first_name) {'bobby'}

    context 'when there is no last name' do
      it 'is invalid if there is no last name' do
        user.last_name = nil
        expect(user).to_not be_valid
      end
    end
  end
end
