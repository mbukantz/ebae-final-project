class Api::BidsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @bids = Bid.all
    render json: @bids
  end
end
