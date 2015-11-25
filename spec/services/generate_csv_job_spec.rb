require 'rails_helper'

RSpec.describe GenerateCSVJob do
  let!(:order) { create(:order) }
  let!(:timestamp) { Time.zone.now.to_i }

  before do
    GenerateCSVJob.perform_async(timestamp, [order.id])
  end

  it "should create the CSV" do
    file = File.open("/tmp/#{timestamp}_order.csv")
    expect(file).to exist?
  end
end