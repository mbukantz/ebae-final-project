class SaleMailer < ApplicationMailer
  default from: "ebae.auctions@gmail.com"

  def seller_email(sale)
    @sale = sale
    @listing = sale.listing
    @seller = sale.listing.seller.user
    @buyer = sale.buyer.user
    mail(to: @seller.email, 
        from: 'bae@ebae.com', 
        subject: "New invoice created for #{@listing.item.name}")
  end

  def buyer_email(sale)
    @sale = sale
    @listing = sale.listing
    @seller = sale.listing.seller.user
    @buyer = sale.buyer.user
    mail(to: @buyer.email,
      from: 'bae@ebae.com', 
      subject: "You just won #{@listing.item.name}!")
  end

end

