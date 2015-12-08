class AdvancedSearchesController < ApplicationController

  def new
    @advanced_search = AdvancedSearch.new
  end

  def create
    # binding.pry
    @advanced_search = AdvancedSearch.new(advanced_search_params)
    @advanced_search.min_price = (advanced_search_params[:min_price].to_f * 100).to_i
    @advanced_search.max_price = (advanced_search_params[:max_price].to_f * 100).to_i
    @advanced_search.save
    redirect_to @advanced_search
  end

  def show
    @advanced_search = AdvancedSearch.find(params[:id])
    # binding.pry
    @results = @advanced_search.listings
  end

   private

  def advanced_search_params
    # binding.pry
    params.require(:advanced_search).permit(:keywords, :category_id, :min_price, :max_price)
  end

end
