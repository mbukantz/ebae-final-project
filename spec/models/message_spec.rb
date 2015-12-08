# == Schema Information
#
# Table name: messages
#
#  id                :integer          not null, primary key
#  sender_id         :integer
#  recipient_id      :integer
#  subject           :string
#  content           :text
#  conversation_id   :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  read_at           :datetime
#  sender_deleted    :boolean
#  recipient_deleted :boolean
#

require 'rails_helper'

RSpec.describe Message, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
