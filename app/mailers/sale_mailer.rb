class SaleMailer < ApplicationMailer
  default from: "ebae.auctions@gmail.com"

  def seller_email(listing)
    @listing = listing
    @seller = listing.seller.user
    mail(to: @seller.email, subject: 'New invoice created')
  end

  def buyer_email(user)
    @user = user
    mail(to: @user.email, subject: 'Invoice for item just won')
  end

end

