class CnnHeatmap < ApplicationRecord
  belongs_to :payload

  has_one_attached :heatmap

  MODELS = {
    resnet50: [ "conv1", "bn1", "relu", "maxpool", "layer1", "layer2", "layer3", "layer4", "avgpool", "fc" ],
    googlenet: [ "conv1", "maxpool1", "conv2", "conv3", "maxpool2", "inception3a", "inception3b", "maxpool3", "inception4a", "inception4b", "inception4c", "inception4d", "inception4e", "maxpool4", "inception5a", "inception5b", "avgpool", "dropout", "fc" ],
   vgg16: [ "features", "avgpool", "classifier" ]
  }

  validates :backbone, presence: true
  validates :target_layer, presence: true
  validates :threshold, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
  validates :alpha, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
  validates :color_r, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 255 }
  validates :color_g, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 255 }
  validates :color_b, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 255 }
end
