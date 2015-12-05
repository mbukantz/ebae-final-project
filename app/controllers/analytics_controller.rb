class AnalyticsController < ApplicationController

  def index
    @analytic = Analytic.new
  end

end
