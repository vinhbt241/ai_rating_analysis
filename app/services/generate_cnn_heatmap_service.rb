class GenerateCnnHeatmapService < ApplicationService
  attr_reader :cnn_heatmap

  def initialize(cnn_heatmap:)
    @cnn_heatmap = cnn_heatmap
  end

  def call
    image = cnn_heatmap.payload.product_images.find(cnn_heatmap.image_id)
    image_base64 = EncodeBase64AttachmentService.call(attachment: image)
    image_base64 = image_base64[:base64_attachment]

    response = client.cnn_heatmap(
      image_base64:,
      backbone: cnn_heatmap.backbone,
      target_layer: cnn_heatmap.target_layer,
      threshold: cnn_heatmap.threshold,
      color: [ cnn_heatmap.color_r, cnn_heatmap.color_g, cnn_heatmap.color_b ],
      alpha: cnn_heatmap.alpha
    )

    base64_heatmap = response["heatmap"]
    decoded_heatmap = Base64.decode64(base64_heatmap)
    io = StringIO.new(decoded_heatmap)

    cnn_heatmap.heatmap.attach(
      io:,
      filename: "cnn_heatmap_#{cnn_heatmap.id}_#{Time.current.to_i}.png",
      content_type: "image/png"
    )
  end

  def client
    @client ||= ImageAppClient.new
  end
end
