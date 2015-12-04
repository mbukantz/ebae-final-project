class SalesController < ApplicationController

  def new
    @sale = Sale.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    listing = Listing.find(sale_params[:listing_id])
    sale = Sale.find_or_initialize_by(listing_id: listing.id)
    sale.buyer = listing.highest_bidder.buyer
    sale.price = listing.current_price + listing.shipping_price
    if sale.save
      redirect_to listing_sale_path(listing, sale)
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
