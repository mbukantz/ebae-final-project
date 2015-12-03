class salesController < ApplicationController

  def new
    @sale = sale.new
  end

  def create
    sale = Sale.create(sale_params)
    if sale.save
      redirect_to sales_path
    else
      redirect_to new_sale_path
    end
  end

  def index
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def sale_params
    params.require(:sale).permit(:listing_id, :buyer_id, :price)
  end


end
