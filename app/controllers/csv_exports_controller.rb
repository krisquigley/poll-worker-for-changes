class CSVExportsController < ApplicationController
  def create
    timestamp = Time.zone.now.to_i.to_s
    
    GenerateCSVJob.perform_async(timestamp, params[:order_ids])

    respond_to do |format|
      format.json { render json: { timestamp: timestamp }, 
                           status: :ok }

    end
  end
end