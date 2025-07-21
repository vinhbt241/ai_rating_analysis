class ImageAppClient
  include HTTParty

  base_uri "localhost:8001"

  def list_models_cnn
    self.class.get("/list_models_cnn")
  end

  def cnn_heatmap(image_base64:)
    self.class.post(
      "/cnn_heatmap",
      body: {
        image_base64:,
        type_image: "base64",
        param: {
          backbone: "",
          target_layer: ""
        }
      }.to_json,
      headers: { "Content-Type" => "application/json" }
    )
  end

  def attention_heatmap(image_base64:)
    self.class.post(
      "/attention_heatmap",
      body: {
        image_base64:,
        type_image: "base64",
        param: {
          topk: 5,
          threshold: 0.5,
          color: [ 0, 0, 255 ]
        }
      }.to_json,
      headers: { "Content-Type" => "application/json" }
    )
  end
end
