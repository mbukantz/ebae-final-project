class WatchlistsController < ApplicationController

skip_before_action :verify_authenticity_token

  def create
    @watchlist = Watchlist.create(buyer_id: current_user.id, listing_id: params[:listing_id])

    @listing = Listing.find(params[:listing_id])

    if request.xhr?
      html_string = render_to_string( 'listings/_watchlist_counter.html.erb', locals: {listing: @listing, watchlist: @watchlist}, layout: false)
      render json: {template: html_string}
    end

    # WatchlistMailer.added_item(watchlist).deliver_now
    # EndingEmailJob.set(wait_until: watchlist.alert_time).perform_later(watchlist)

  end

  def destroy
    @watchlist = Watchlist.find(params[:id])
    @listing = @watchlist.listing
    # watched_item = @watchlist
    # WatchlistMailer.removed_item(watched_item).deliver_now
    Watchlist.destroy(@watchlist.id)

    if request.xhr?
      html_string = render_to_string( 'listings/_watchlist_counter.html.erb', locals: {listing: @listing, watchlist: @watchlist}, layout: false)
      render json: {template: html_string}
    end

  end

end
