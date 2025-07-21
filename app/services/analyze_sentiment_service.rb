class AnalyzeSentimentService < ApplicationService
  attr_reader :text_input

  def initialize(text_input:)
    @text_input = text_input
  end

  def call
    client.predict_explain(text_input:)
  end

  def client
    @client ||= SentimentAnalysisClient.new
  end
end
