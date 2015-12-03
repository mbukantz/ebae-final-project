# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
require 'rails_helper'

RSpec.describe Category, :type => :model do
 let(:category) {FactoryGirl.build(:category)}

   context 'when a category is invalid' do
      it 'is invalid without a name' do
       category.name = nil
       expect(category).to_not be_valid
     end
   end
end
