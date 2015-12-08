# Preview all emails at http://localhost:3000/rails/mailers/watchlist_mailer
class WatchlistMailerPreview < ActionMailer::Preview

  def added_item_preview
    WatchlistMailer.added_item(Watchlist.first)
  end

  def removed_item_preview
    WatchlistMailer.removed_item(Watchlist.first)
  end

  def item_ending_preview
    WatchlistMailer.item_ending(Watchlist.first)
  end

end


