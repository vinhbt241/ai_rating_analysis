class SentimentAnalysisClient
  include HTTParty

  base_uri "localhost:8000"

  def predict(text_input:)
    self.class.post(
      "/predict",
      body: {
        text_input:
      }.to_json,
      headers: { "Content-Type" => "application/json" }
    )
  end

  def predict_explain(text_input:)
    self.class.post(
      "/predict_explain",
      body: {
        text_input:
      }.to_json,
      headers: { "Content-Type" => "application/json" }
    )
  end
end
