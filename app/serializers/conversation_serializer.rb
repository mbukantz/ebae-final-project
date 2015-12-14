class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :initiator_id, :noninitiator_id, :listing_id
end
