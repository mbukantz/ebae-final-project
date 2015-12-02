class SearchController < ApplicationController

 def index
  # keyword = params[:search][:keyword]
  listing = params[:keyword]
  @listings = Search.for(listing)
  if @listings.size == 1
    listing = @listings.first
    redirect_to listing_path(listing)
  elsif @listings.size == 0
    flash.now.notice = "No results matching that query."
    render '/listings/index'
  else
    render '/listings/index'
  end
end

end
