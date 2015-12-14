class SellerSerializer < ActiveModel::Serializer
  attributes :id
  has_many :listings
end
