class WatchlistsController < ApplicationController

  def create
    if Watchlist.already_watched?(current_user.id, params[:listing_id])
      redirect_to listing_path(params[:listing_id])
    else 
      watchlist = Watchlist.create(buyer_id: current_user.id, listing_id: params[:listing_id])
      WatchlistMailer.added_item(watchlist).deliver_now
      EndingEmailJob.set(wait: 45.seconds).perform_later(watchlist)
      redirect_to listing_path(params[:listing_id])
    end
  end

  def destroy 
    watchlist = Watchlist.find_watchlist(current_user.id, params[:listing_id]) 
    watched_item = watchlist.first
    WatchlistMailer.removed_item(watched_item).deliver_now
    Watchlist.destroy(watchlist.first.id)
    redirect_to dashboard_index_path
  end

end
