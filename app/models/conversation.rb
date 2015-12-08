# == Schema Information
#
# Table name: conversations
#
#  id              :integer          not null, primary key
#  initiator_id    :integer
#  noninitiator_id :integer
#  listing_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Conversation < ActiveRecord::Base

  belongs_to :initiator, class_name: 'User'
  belongs_to :noninitiator, class_name: 'User'
  belongs_to :listing
  has_many :messages

  def users
    [self.initiator, self.noninitiator]
  end

  def find_counterpart(user)
    self.users.find {|usr| usr.id != user.id}
  end

end
