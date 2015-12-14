class BuyerSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  has_one :user
  has_many :sales
  has_many :watchlists
  has_many :bids
end
