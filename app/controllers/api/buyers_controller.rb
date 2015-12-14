class Api::BuyersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @buyers = Buyer.all
    render json: @buyers
  end

end
