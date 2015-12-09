class ChargesController < ApplicationController

  def create
    
    @sale = Sale.find(params["sale_id"])

    stripe = Adapters::StripeAdapter.new
    customer = stripe.create_customer(params)
    charge = stripe.create_charge(customer, @sale)

    Charge.create(sale_id: @sale.id)

    redirect_to listing_sale_path(@sale.listing, @sale)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to listing_sale_path(@sale.listing, @sale)
  end

end
