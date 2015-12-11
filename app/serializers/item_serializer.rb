class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_one :listing
  has_one :condition

  def attributes
    attributes = super
    attributes[:category] = object.category.try(:as_json)
    attributes
  end
end
