module Payloads
  class CnnHeatmapsController < ApplicationController
    before_action :prepare_payload

    def index
      @cnn_heatmaps = @payload.cnn_heatmaps.order(created_at: :desc)
    end

    def new
      @cnn_heatmap = CnnHeatmap.new
    end

    def create
      @cnn_heatmap = CnnHeatmap.new(cnn_heatmap_params)
      @cnn_heatmap.payload = @payload

      if @cnn_heatmap.save
        GenerateCnnHeatmapService.call(cnn_heatmap: @cnn_heatmap)
        redirect_to payload_cnn_heatmaps_path(payload_id: @payload.id)
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def prepare_payload
      @payload = Payload.find(params[:payload_id])
    end

    def cnn_heatmap_params
      params.require(:cnn_heatmap).permit!
    end
  end
end
