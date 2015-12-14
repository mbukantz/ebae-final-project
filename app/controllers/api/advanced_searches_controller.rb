class Api::AdvancedSearchesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @advanced_searches = AdvancedSearch.all
    render json: @advanced_searches
  end
end
