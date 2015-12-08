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
  listing_bids_array = counts.group_by {|k,v| v}.max.last
  listing_bids_array.each_with_object({}) do | listing_array, bid_count_hash|
      listing = Listing.find(listing_array[0])
      bid_count_hash[listing] = listing_array[1]
  end
end



 # category that fetches highest price, on average
 # seller with the most earnings
 # buyer with the best reviews
 # seller with the best reviews
 # most watched items of all time 
 # highest price in the last month


end