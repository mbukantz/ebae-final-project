class Api::ChargesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @charges = Charge.all
    render json: @charges
  end

end
