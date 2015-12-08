# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do
  Order.create!(name: Faker::Name.name,
                address: Faker::Address.street_address,
                city: Faker::Address.city,
                county: Faker::Address.state,
                postcode: Faker::Address.zip,
                email: Faker::Internet.email)
end