# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10000.times do |i|
  Product.create(sku: Faker::Code.isbn, name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, price_cents: Faker::Commerce.price * 100, active: true)
end
