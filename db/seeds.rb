# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = [
  ["Books", "Book description"],
  ["Clothes", "Clothes description"],
  ["Face, Hair, Body", "Description of item"],
  ["Food & Beverage", "foodies"],
  ["Gifts", "Description of gift"],
  ["Household", "Description of item"],
  ["Stationery", "office supplies"]  
]
charities = [
  ["St Vinnies", "Where all the cool kids hang", "www.vinnies.org.au‎", "Vincent", "0412345678", "admin@vinnies.com.au"],
  ["Cancer Council", "Organisation to help people with cancer", "www.cancercouncil.org.au‎", "Joan Rivers", "0414875768", "admin@cancercouncil.com.au"],
  ["Coast Shelter", "Provides accomodation and support programs for homeless people", "www.coastshleter.org.au", "Joe Bloss", "0412345678", "admin@coastshelter.com.au"],
  ["Salvation Army", "Christian charitable organisation", "www.salvos.org.au‎", "Vincent", "0412865483", "admin@salvos.com.au"] 
]
retailers = [
  ["Bakers Delight", "Bread maker", "www.bakersdelight.com.au", "Fred the Baker", "0412876345", "fred@bakers.com.au"],	
  ["Myer", "Myer is a big retailer with a long bio", "www.myer.com.au", "Bernie Brookes", "0412345678", "contact@myer.com.au"],
  ["Artarmon Fruit Shop", "Best fruit and veg in Artarmon", " ", "William Smith", "98678576", " "],
  ["Joans Clothing", "Womens clothing in Penrith", "www.joansclothing.com.au", "Joan Jett", "0412345678", "joan@joansclothing.com.au"],
  ["Strathfield Pharmacy", "Complete pharmacy", "www.strathfieldpharm.com.au", "Bill Brooks", "0408576432", "manager@strathfieldpharm.com.au"],
  ["Funland Toys", "Toys for young and old", "www.funland.com.au", "Mary Wright", "0413859432", "mwright@funland.com.au"]
]
offers = [
  ["Bread", "20 cape seed rolls", "Artarmon, Sydney", nil, 1, 4, Date.new(2014, 03, 25), "Pickup"],
  ["Shoes", "Colourful footwear", "Glebe, Sydney", nil, 2, 2, Date.new(2014, 05, 05), "Drop off"],
  ["10 kg tomatoes", "Very ripe need to be used quickly", "Artarmon, Sydney", nil, 3, 4, Date.new(2014, 04, 20), "Pickup"],
  ["Kids shoes", "Suit 2 year old girl", "Artarmon, Sydney", nil, 4, 2, Date.new(2014, 04, 20), "Pickup"],
  ["Baby products", "Assorted toiletries for babies", "Chatswood, Sydney", nil, 4, 3, Date.new(2014, 04, 29), "Drop off"],
  ["Kids Toys", "Cute fluffy toys", "Cronulla, Sydney", nil, 6, 5, Date.new(2014, 04, 29), "Pickup"],
  ["Cookware", "Good quality pots and pans", "Hornsby, Sydney", nil, 2, 6, Date.new(2014, 04, 30), "Pickup"]   
]

categories.each do |name, description|
  Category.create("name" => name, "description" => description)
end

charities.each do |name, bio, webpage, contact_name, contact_phone, contact_email|
  Charity.create("name" => name, "bio" => bio, "webpage" => webpage, "contact_name" => contact_name, "contact_phone" => contact_phone, "contact_email" => contact_email)
end

retailers.each do |name, bio, web_page, contact_name, contact_phone, contact_email|
  Retailer.create("name" => name, "bio" => bio, "web_page" => web_page, "contact_name" => contact_name, "contact_phone" => contact_phone, "contact_email" => contact_email)
end

offers.each do |title, description, location, charity_id, retailer_id, category_id, offer_ends, delivery_options|
  Offer.create!("title" => title, "description" => description, "location" => location, "charity_id" => charity_id, "retailer_id" => retailer_id, "category_id" => category_id, "offer_ends" => offer_ends, "delivery_options" => delivery_options)
end