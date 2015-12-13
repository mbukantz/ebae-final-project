class AnalyticViewObject

  def highest_sale_price
   Sale.order(price: :desc).first
  end

  def highest_sale_this_month
    Sale.order(price: :desc).where(created_at: Date.today.beginning_of_month..Date.today.end_of_month).first
  end

  def average_sale_this_month
    month_sales = Sale.where(created_at: Date.today.beginning_of_month..Date.today.end_of_month)
    month_sales.average(:price).to_f
  end

  def lowest_sale_this_month
    Sale.order(:price).where(created_at: Date.today.beginning_of_month..Date.today.end_of_month).first
  end

  def auctions_by_category
   category_count_by_category_id = Item.group(:category_id).count
   category_count_with_names = Category.all.each_with_object({}) do | category, category_count_hash|
    category_count_hash[category.name] = category_count_by_category_id[category.id] if category_count_by_category_id[category.id] != nil
   end
   category_count_with_names.sort_by{|k, v| v}.reverse.to_h
  end

  def most_popular_by_bids
    if Bid.all.count > 0
      counts = Bid.group(:listing_id).count
      listing_bids_array = counts.group_by {|listing_id, num_bids| num_bids}.max.last
      #[[35, 2],[14, 2]]
      listing_bids_array.each_with_object({}) do | listing_array, bid_count_hash|
          listing = Listing.find(listing_array[0])
          bid_count_hash[listing] = listing_array[1]
      end
    end
    # {<Listing#35> => 2, <Listing#14 => 2}
  end

  def most_watched_listing
    listing_array = Listing.all.to_a
    most_watched= nil
    watches = 0
    listing_array.each do |obj|
      if obj.watchlist_total > watches
        watches = obj.watchlist_total
        most_watched = obj
      end
    end
    most_watched
  end

  def users_by_state
    top20 = Location.group(:state).count.sort_by {|k,v| v}.reverse[0..19]
    top20_users = 0
    top20.each do |k,v|
      top20_users += v
    end
    other = User.count - top20_users
    input = top20.to_h
    input["Other"] = other
    input
  end

end
