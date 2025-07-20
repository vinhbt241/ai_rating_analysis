class Payload < ApplicationRecord
  has_many_attached :product_images

  # validations
  validates :comment, presence: true
  validates :product_name, presence: true
  validates :product_quality_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :seller_service_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :delivery_service_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  # scopes
  scope :analyzed, -> { where.not("analyzed_result = '{}'") }
end
