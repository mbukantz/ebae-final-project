class Api::SellersController < ApplicationController
skip_before_action :verify_authenticity_token

  def index
    @sellers = Seller.all
    render json: @sellers
  end

end
