class PayloadsController < ApplicationController
  def create
    @payload = Payload.new(payload_params)

    if @payload.save
      # analyzed_result = AnalyzePayloadService.call(payload: @payload)
      # @payload.update(analyzed_result:)

      # generate_attention_heatmaps(payload: @payload)
      # generate_sentiment_analysis(payload: @payload)

      flash[:notice] = "Rating submitted & analyzed successfully!"
      redirect_to payload_path(@payload)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @payload = Payload.new
  end

  def show
    @payload = Payload.find(params[:id])

    render :show
  end

  private

  def payload_params
    params.require(:payload).permit!
  end

  def generate_attention_heatmaps(payload:)
    payload.product_images.find_each do |image|
      encoded_data = EncodeBase64AttachmentService.call(attachment: image)
      base64_image = encoded_data[:base64_attachment]
      GenerateAttentionHeatmapService.call(base64_image:, payload:)
    end
  end

  def generate_sentiment_analysis(payload:)
    text_input = payload.comment
    sentiment_analysis_result = AnalyzeSentimentService.call(text_input:)
    payload.update(
      sentiment_analysis_result:
    )
  end
end
