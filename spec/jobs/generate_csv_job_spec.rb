require 'rails_helper'

RSpec.describe GenerateCSVJob, sidekiq: :inline do
  let!(:order) { create(:order) }
  let!(:timestamp) { Time.zone.now.to_i.to_s }

  before do
    GenerateCSVJob.perform_async(timestamp, order.id)
  end

  it "should create the CSV" do
    expect(File).to exist("/tmp/#{timestamp}_order.csv")
  end
end