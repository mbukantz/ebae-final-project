class ListingSerializer < ActiveModel::Serializer
  attributes :id, :starting_price, :current_price, :shipping_price, :seller_id, :end_time, :duration

  has_many :watchlists
  has_many :bids
  has_many :recently_viewed_listings
  has_many :conversations
end
