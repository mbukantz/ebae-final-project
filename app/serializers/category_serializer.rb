class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :item_ids
  # has_many :items
end
