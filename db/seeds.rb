# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

x = 2

conditions = Condition.create([{description: 'New'},{description: 'Used-Like-New'},{description: 'Used-Very-Good'},{description: 'Used-Good'},{description: 'Used-Fair'},{description: 'Refurbished'},{description: 'Used-Acceptable'}])


x.times do |i|
  user = User.new
    user.first_name = Faker::Name.first_name
    user.last_name = Faker::Name.last_name
    user.email = Faker::Internet.email
    user.birthday = Faker::Date.between(30.years.ago, 18.years.ago)
    user.save
  end


x.times do |i|
  location = Location.new
    location.street = Faker::Address.street_address
    location.city = Faker::Address.city
    location.state = Faker::Address.state
    location.zip = Faker::Address.zip
    location.label = "home"
    location.user_id = i + 1
    location.save
  end

  x.times do |i|
    phone = Phone.new
    phone.number = Faker::PhoneNumber.phone_number
    phone.type = "cell"
    phone.user_id = i + 1
    phone.save
  end

  x.times do |i|
    buyer = Buyer.new
    buyer.user_id = i + 1
    buyer.save
    seller = Seller.new
    seller.user_id = i + 1
    seller.save
  end

  x.times do |i|
    item = Item.new
    item.name = Faker::Commerce.product_name
    item.description = Faker::Company.catch_phrase
    item.picture_url = Faker::Company.logo
    item.condition_id = rand(1..7)
    item.save
  end

  x.times do |i|
    listing = Listing.new
    listing.item_id = i + 1
    listing.starting_price = Faker::Commerce.price * 100
    listing.current_price = listing.starting_price
    listing.shipping_price = Faker::Commerce.price
    listing.seller_id = i + 1
    listing.start_time = Faker::Date.forward(5)
    listing.duration = rand(3..10)
    listing.save
  end

  x.times do |i|
    review = Review.new
    review.transaction_id = i + 1
  end
