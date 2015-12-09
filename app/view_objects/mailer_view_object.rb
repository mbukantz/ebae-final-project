class MailerViewObject

  attr_reader :sale

  def initialize(sale)
    @sale = sale
  end

  def seller_name_email
  @seller = @sale.listing.seller.user
  @seller.name + ", " + @seller.email
  end

  def seller_phones
  @seller = @sale.listing.seller.user
  phones = @seller.phones.map do |phone|
    phone.label.capitalize + ": " + phone.number
    end
  end

  def seller_address
    @seller.locations.map do |location|
     location.label.capitalize
        location.street + ", " +
        location.city + ", " + location.state + ' ' + location.zip
    end
  end

  def buyer_name_email
  @buyer = sale.buyer.user
  @buyer.name + ", " + @buyer.email
  end

  def buyer_phones
  @buyer = sale.buyer.user
  phones = @buyer.phones.map do |phone|
    phone.label.capitalize + ": " + phone.number
    end
  end

  def buyer_address
    @buyer.locations.map do |location|
     location.label.capitalize
        location.street + ", " +
        location.city + ", " + location.state + ' ' + location.zip
    end
  end
 
  

end