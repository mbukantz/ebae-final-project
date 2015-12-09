module  Adapters
  class StripeAdapter

    def create_customer(params)
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    end

    def create_charge(customer,sale)
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => sale.price,
        :description => "#{sale.id}",
        :currency    => 'usd',
      )
    end
  end
end
