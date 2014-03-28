# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = [
  ["Clothes", "Clothes description"],
  ["Food & Beverage", "foodies"]
]
charities = [
  ["St Vinnies", "Where all the cool kids hang", "www.vinnies.org.au‎", "Vincent", "0412345678", "admin@vinnies.com.au"]
]
retailers = [
  ["Myer", "Myer is a big retailer with a long bio", "www.myer.com.au", "Bernie Brookes", "0412345678", "contact@myer.com.au"]
]
offers = [
  ["Bread", "Fresh bread which we dont need", "Glebe, Sydney", nil, 1, 1]
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

offers.each do |title, description, location, charity_id, retailer_id, category_id|
  Offer.create("title" => title, "description" => description, "location" => location, "charity_id" => charity_id, "retailer_id" => retailer_id, "category_id" => category_id)
end