class ExampleMailer < ApplicationMailer
  default from: "ebae.auctions@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
  
end
