class Order < ActiveRecord::Base
  validates :name, :address, :city, :county, :postcode, :email, presence: true
end