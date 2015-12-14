class BidSerializer < ActiveModel::Serializer
  attributes :id, :amount, :listing_id, :buyer_id

  
end
