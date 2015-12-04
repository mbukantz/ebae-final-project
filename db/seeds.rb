# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

x = 6 #users
y = 10 #listings
z = 5 #sales, which is lower than listings
w = 7 #number of categories


conditions = Condition.create([{description: 'New'},{description: 'Used-Like-New'},{description: 'Used-Very-Good'},{description: 'Used-Good'},{description: 'Used-Fair'},{description: 'Refurbished'},{description: 'Used-Acceptable'}])


x.times do |i|
  user = User.new
    user.first_name = Faker::Name.first_name
    user.last_name = Faker::Name.last_name
    user.email = Faker::Internet.email
    user.birthday = Faker::Date.between(30.years.ago, 18.years.ago)
    user.password_digest = "password123"
    user.remember_digest = "password123"
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
    phone.label = "cell"
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

  w.times do |i|
    category = Category.new
    category.name = Faker::Commerce.department
    category.save
  end

  y.times do |i|
    item = Item.new
    item.name = Faker::Commerce.product_name
    item.description = Faker::Company.catch_phrase
    item.picture_url = Faker::Company.logo
    item.condition_id = rand(1..7)
    item.listing_id = i + 1
    item.save
  end

  y.times do |i|
    category_item = CategoryItem.new
    category_item.item_id = i + 1
    category_item.category_id = rand(1..w)
  end

  y.times do |i|
    listing = Listing.new
    listing.starting_price = Faker::Commerce.price * 100
    listing.current_price = listing.starting_price + 10
    listing.shipping_price = Faker::Commerce.price
    listing.seller_id = rand(1..x)
    listing.start_time = Faker::Date.between(20.days.ago, Date.today)
    listing.duration = rand(3..10)
    listing.end_time = listing.start_time + listing.duration.days
    listing.save
  end

  z.times do |i|
    sale = Sale.new
    sale.listing_id = i + 1
    sale.buyer_id = rand(1..x)
    sale.price = Faker::Commerce.price * 100
    sale.save
  end

  z.times do |i|
    review = Review.new
    review.sale_id = i + 1
    review.rating = rand(1..5)
    review.comments = Faker::Lorem.sentence
    review.save
  end

  20.times do |i|
    bid = Bid.new
    bid.listing_id = rand(1..y)
    bid.amount = bid.listing.current_price + 10
    bid.buyer_id = rand(1..x)
    bid.created_at = Faker::Date.backward(15)          
    bid.save         
  end

