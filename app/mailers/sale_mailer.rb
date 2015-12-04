class SaleMailer < ApplicationMailer
  default from: "ebae.auctions@gmail.com"

  def seller_email(sale)
    @sale = sale
    @listing = sale.listing
    @seller = sale.listing.seller.user
    @buyer = sale.buyer.user
    mail(to: @seller.email, from: 'bae@ebae.com', subject: 'New invoice created')
  end

  def buyer_email(user)
    @user = user
    mail(to: @user.email, subject: 'Invoice for item just won')
  end

end

