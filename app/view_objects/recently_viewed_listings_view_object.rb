class RecentlyViewedListingsViewObject

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def has_viewed_listings?
    user.recently_viewed_listings.length > 0 ? true : false
  end

  def last_five_views
    user.recently_viewed_listings.last(5)
  end

  def most_recent_listings
    Listing.all.last(5)
  end

end
