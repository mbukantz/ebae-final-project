class Api::ListingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @listings = Listing.all
    render json: @listings
  end
end
