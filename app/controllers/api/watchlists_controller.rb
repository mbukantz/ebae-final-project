class Api::WatchlistsController < ApplicationController
skip_before_action :verify_authenticity_token

  def index
    @watchlists = Watchlist.all
    render json: @watchlists
  end

end
