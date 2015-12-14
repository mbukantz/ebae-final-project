class Api::ReviewsController < ApplicationController
    skip_before_action :verify_authenticity_token
  def index
    @reviews = Review.all
    render json: @reviews
  end

end
