class ChargesController < ApplicationController

  def create

    @sale = Sale.find(params["sale_id"])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @sale.price,
      :description => "#{@sale.id}",
      :currency    => 'usd',
      # :fee => (sale.price * 0.05 / 100),
      # :metadata => {'sale_id' => "#{sale.id}", 'sale.buyer_id' => "#{sale.buyer_id}", 'seller_id' => "#{sale.seller.id}"}
    )

    Charge.create(sale_id: @sale.id)

    redirect_to listing_sale_path(@sale.listing, @sale)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to listing_sale_path(@sale.listing, @sale)
  end

end