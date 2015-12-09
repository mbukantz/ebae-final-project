class WatchlistMailer < ApplicationMailer
  default from: "ebae.auctions@gmail.com"

  def added_item(watchlist)
    @watchlist = watchlist
    @listing = watchlist.listing
    @watcher = watchlist.buyer.user
    mail(to: @watcher.email,
        from: 'bae@ebae.com',
        subject: "Now watching #{@listing.item.name}")
  end

  def removed_item(watchlist)
    @watchlist = watchlist
    @listing = watchlist.listing
    @watcher = watchlist.buyer.user
    mail(to: @watcher.email,
        from: 'bae@ebae.com',
        subject: "No longer watching #{@listing.item.name}")
  end

  def item_ending(watchlist)
    @watchlist = watchlist
    @listing = watchlist.listing
    @watcher = watchlist.buyer.user
    mail(to: @watcher.email,
        from: 'bae@ebae.com',
        subject: "The end is near for #{@listing.item.name}!"
  end

end
