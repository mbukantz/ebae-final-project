class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :locations
  has_many :phones
  has_many :reviews
  has_many :recently_viewed_listings
  has_many :conversations
  has_many :messages
end
