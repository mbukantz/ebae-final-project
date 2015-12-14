class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comments, :user_id
  has_one :sale
  has_one :user
end
