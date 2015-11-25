require 'faker'

FactoryGirl.define do
  factory :order do
    name     { Faker::Name.name }
    address  { Faker::Address.street_address }
    city     { Faker::Address.city }   
    county   { Faker::Address.state }
    postcode { Faker::Address.zip }
    email    { Faker::Internet.email }
  end
end