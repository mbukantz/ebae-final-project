class AnalyticsController < ApplicationController

  def index
    @analytic = Analytic.new
    respond_to do |format|
      format.html 
      format.json { 
        @categories_count = @analytic.auctions_by_category
        render json: {categories_count: @categories_count}
      }
    end
  end

end
