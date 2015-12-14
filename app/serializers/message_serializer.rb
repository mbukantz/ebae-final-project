class MessageSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :recipient_id, :subject, :content, :conversation_id, :read_at, :sender_deleted, :recipient_deleted
end
