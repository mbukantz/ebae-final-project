class RecentlyViewedListingSerializer < ActiveModel::Serializer
  attributes :id, :listing_id, :user_id
end
