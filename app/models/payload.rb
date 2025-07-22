class Payload < ApplicationRecord
  has_many_attached :product_images
  has_many_attached :shop_images
  has_many_attached :attention_heatmaps

  # validations
  validates :comment, presence: true
  validates :product_name, presence: true
  validates :product_quality_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :seller_service_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :delivery_service_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  # scopes
  scope :analyzed, -> { where.not("analyzed_result = '{}'") }

  # associations
  has_many :cnn_heatmaps, dependent: :destroy

  def comment_tone
    return if sentiment_analysis_result.blank?

    {
      POS: "POSITIVE",
      NEG: "NEGATIVE",
      NEU: "NEUTRAL"
    }[sentiment_analysis_result["pred"].max.first.to_sym]
  end
end
