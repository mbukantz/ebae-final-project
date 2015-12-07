class RecentlyViewedListingsViewObject

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def has_viewed_listings?
    user.recently_viewed_listings.length > 0 ? true : false
  end

  def recent_views
    user.recently_viewed_listings.last(4)
  end

  def most_recent_listings
    Listing.all.last(4)
  end

end
