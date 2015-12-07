# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  sender_id       :integer
#  recipient_id    :integer
#  subject         :string
#  content         :text
#  conversation_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Message < ActiveRecord::Base

  belongs_to :conversation
  has_one :listing, through: :conversation
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'
  accepts_nested_attributes_for :sender, :recipient, :conversation

  # def conversation_attributes=(listing_id)
  #   Conversation.find_or_create_by(listing_id: listing_id)
  #   Conversation.where(listing_id: listing_id, initiator_id: )
  # end

end
