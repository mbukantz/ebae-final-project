# == Schema Information
#
# Table name: advanced_searches
#
#  id          :integer          not null, primary key
#  keywords    :string
#  category_id :integer
#  min_price   :integer
#  max_price   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe AdvancedSearch, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
