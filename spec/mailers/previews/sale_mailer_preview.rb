# Preview all emails at http://localhost:3000/rails/mailers/sale_mailer
class SaleMailerPreview < ActionMailer::Preview

  def seller_mail_preview
    SaleMailer.seller_email(Listing.first)
  end

  def buyer_mail_preview
    SaleMailer.buyer_email(User.first)
  end

end
