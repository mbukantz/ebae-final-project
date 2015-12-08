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

class Message < ActiveRecord::Base

  belongs_to :conversation
  has_one :listing, through: :conversation
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'
  accepts_nested_attributes_for :sender, :recipient, :conversation

  def conversation_attributes=(hash)
    conversation = Conversation.find_or_create_by(hash)
    self.conversation = conversation
  end

  def read?
    !!read_at
  end

end
