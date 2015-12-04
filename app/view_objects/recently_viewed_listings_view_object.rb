class RecentlyViewedListingsViewObject

  def has_viewed_listings?
    current_user.recently_viewed_listings.length > 0 ? true : false
  end

  def last_five_views
    current_user.recently_viewed_listings.last(5)
  end

  def most_recent_listings
    Listing.all.last(5)
  end



end
