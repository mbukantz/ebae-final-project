class SaleMailer < ApplicationMailer
  default from: "ebae.auctions@gmail.com"

  def seller_email(user)
    @user = user
    mail(to: @user.email, subject: 'You just made a new sale!')
  end

end

