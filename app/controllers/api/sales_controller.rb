class Api::SalesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @sales = Sale.all
    render json: @sales
  end

end
