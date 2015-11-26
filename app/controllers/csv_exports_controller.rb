class CSVExportsController < ApplicationController
  def create
    timestamp = Time.zone.now.to_i.to_s
    
    GenerateCSVJob.perform_async(timestamp, params[:order_ids])

    respond_to do |format|
      format.json { render json: { url: csv_export_path(timestamp) }, 
                           status: :ok }

    end
  end

  def show
    timestamp = params[:id]
    if File.exist?("/tmp/#{timestamp}_order.csv") 
      respond_to do |format|
        format.csv { send_file File.open("/tmp/#{timestamp}_order.csv") }
        format.json do
          render json: { file: csv_export_path(timestamp, format: :csv)}
        end
      end
    else
      head :not_found
    end
  end
end