# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do
  Order.create!(name: "John Doe", 
                address: "12 Random Street",
                city: "Leeds",
                county: "West Yorkshire",
                postcode: "LS1 1AA",
                email: "john@example.come")
end