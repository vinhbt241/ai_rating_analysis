class RemoveDetailRatingColumnFromPayloadsTable < ActiveRecord::Migration[8.0]
  def change
    remove_column :payloads, :detail_rating, :string
  end
end
