class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :condition_id, :listing_id, :category_id
  has_one :listing
  has_one :condition
end
