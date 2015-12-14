class Api::RecentlyViewedListingsController < ApplicationController
  def index
    @recently_viewed_listings = RecentlyViewedListing.all
    render json: @recently_viewed_listings
  end
end
