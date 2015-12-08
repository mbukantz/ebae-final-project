class WatchlistsController < ApplicationController

  def create
    if Watchlist.already_watched?(current_user.id, params[:listing_id])
      redirect_to listing_path(params[:listing_id])
    else 
      watchlist = Watchlist.create(buyer_id: current_user.id, listing_id: params[:listing_id])
      WatchlistMailer.added_item(watchlist).deliver_now
      redirect_to listing_path(params[:listing_id])
    end
  end

  def destroy 
    watchlist = Watchlist.find_watchlist(current_user.id, params[:listing_id]) 
    list = watchlist.first
    WatchlistMailer.removed_item(list).deliver_now
    Watchlist.destroy(watchlist.first.id)
    redirect_to dashboard_index_path
  end

end
