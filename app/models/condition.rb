# == Schema Information
#
# Table name: conditions
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Condition < ActiveRecord::Base
end
