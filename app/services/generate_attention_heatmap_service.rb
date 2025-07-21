class GenerateAttentionHeatmapService < ApplicationService
  attr_reader :base64_image, :payload

  def initialize(base64_image:, payload:)
    @base64_image = base64_image
    @payload = payload
  end

  def call
    response = client.attention_heatmap(image_base64: base64_image)
    base64_heatmap = response["heatmap"]
    decoded_heatmap = Base64.decode64(base64_heatmap)
    io = StringIO.new(decoded_heatmap)
    payload.attention_heatmaps.attach(
      io:,
      filename: "heatmap_#{payload.id}_#{Time.current.to_i}.png",
      content_type: "image/png"
    )
  end

  def client
    @client ||= ImageAppClient.new
  end
end
