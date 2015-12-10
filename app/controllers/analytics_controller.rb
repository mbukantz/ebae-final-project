class AnalyticsController < ApplicationController

 def index
   respond_to do |format|
     format.html
     format.json {
       @categories_count = @analytic.auctions_by_category
       render json: {categories_count: @categories_count}
     }
   end
 end

 def highest_sale_price

 end

end
