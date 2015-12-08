class EndingEmailJob < ActiveJob::Base
  queue_as :default

  def perform(watchlist)
    @watchlist = watchlist
    WatchlistMailer.item_ending(@watchlist).deliver_later
  end
end
