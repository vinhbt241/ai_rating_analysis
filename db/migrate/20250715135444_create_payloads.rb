class CreatePayloads < ActiveRecord::Migration[8.0]
  def change
    create_table :payloads do |t|
      t.text :comment
      t.string :product_name
      t.text :bought_products
      t.string :detail_rating
      t.string :sub_category
      t.timestamps
    end
  end
end
