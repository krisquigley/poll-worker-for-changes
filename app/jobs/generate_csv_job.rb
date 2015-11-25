require 'csv'

class GenerateCSVJob
  include Sidekiq::Worker

  def perform(timestamp, order_ids)
    orders = Order.where(id: order_ids)

    file = Tempfile.new(timestamp)

    CSV.open(file, "wb") do |csv|
      csv << ["Name", "Address", "City", "County", "Postcode", "Email"]
      orders.each do |order|
        csv << [order.name, order.address, order.city, order.county, order.postcode, order.email]
      end
    end

    File.rename(file.path, "/tmp/#{timestamp}_order.csv")
  end
end