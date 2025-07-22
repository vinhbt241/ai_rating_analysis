class CreateCnnHeatmaps < ActiveRecord::Migration[8.0]
  def change
    create_table :cnn_heatmaps do |t|
      t.references :payload
      t.bigint :image_id
      t.string :backbone
      t.string :target_layer
      t.float :threshold
      t.float :alpha
      t.integer :color_r
      t.integer :color_g
      t.integer :color_b
      t.timestamps
    end
  end
end
