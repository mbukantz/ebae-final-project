class Api::ConditionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @conditions = Condition.all
    render json: @conditions
  end

end
