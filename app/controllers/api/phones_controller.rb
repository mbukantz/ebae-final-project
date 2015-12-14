class Api::PhonesController < ApplicationController
  def index
    @phones = Phone.all
    render json: @phones
  end
end
