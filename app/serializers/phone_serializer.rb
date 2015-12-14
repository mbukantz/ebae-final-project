class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :number, :label, :user_id
end
