# == Schema Information
#
# Table name: conditions
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'
require 'rails_helper'

RSpec.describe Condition, :type => :model do
 let(:condition) {FactoryGirl.build(:condition)}

   context 'when a condition is invalid' do
      it 'is invalid without a description' do
       condition.description = nil
       expect(condition).to_not be_valid
     end
   end
end
