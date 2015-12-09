class ExampleMailer < ApplicationMailer
  default from: "ebae.auctions@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, 
      from: 'welcome@ebae.com',
      subject: 'Welcome to eBae!')
  end
  
end
