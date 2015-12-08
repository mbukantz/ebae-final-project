class AnalyticViewObject

  def highest_sale_price
   Sale.order(price: :desc).first
  end

  def highest_sale_this_month
  Sale.order(price: :desc).where(created_at: Date.today.beginning_of_month..Date.today.end_of_month).first
  end

  def auctions_by_category
   category_count = Item.group(:category_id).count
    # => {1=>1, 4=>4, 5=>3, 7=>2} 
   category_count_with_names = Category.all.each_with_object({}) do | category_obj, category_count_hash|
     if category_count[category_obj.id]
       category_count_hash[category_obj.name] = category_count[category_obj.id]
     end
   end
   category_count_with_names.sort_by{|k, v| v}.reverse
  end

  def most_popular_by_bids
    counts = Bid.group(:listing_id).count
    listing_bids_array = counts.group_by {|listing_id, num_bids| num_bids}.max.last
    #[[35, 2],[14, 2]]
    listing_bids_array.each_with_object({}) do | listing_array, bid_count_hash|
        listing = Listing.find(listing_array[0])
        bid_count_hash[listing] = listing_array[1]
    end
    # {<Listing#35> => 2, <Listing#14 => 2}
  end

  def users_by_state
    Location.group(:state).count
    # {"Alabama"=>2, "Arizona"=>1, "California"=>1, "Idaho"=>1, "Indiana"=>1, "Kentucky"=>1, "Louisiana"=>1, "Maine"=>1, "Mississippi"=>1, "Missouri"=>1, "North Dakota"=>1, "Ohio"=>1, "South Dakota"=>1, "Texas"=>1, "Vermont"=>1, "Virginia"=>2, "Wisconsin"=>1, "Wyoming"=>1}
  end





 # category that fetches highest price, on average
 # seller with the most earnings
 # buyer with the best reviews
 # seller with the best reviews
 # most watched items of all time 
 # highest price in the last month


end