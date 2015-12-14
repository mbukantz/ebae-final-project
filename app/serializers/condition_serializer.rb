class ConditionSerializer < ActiveModel::Serializer
  attributes :id, :description
  has_many :items
end
