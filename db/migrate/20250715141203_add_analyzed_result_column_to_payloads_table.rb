class AddAnalyzedResultColumnToPayloadsTable < ActiveRecord::Migration[8.0]
  def change
    add_column :payloads, :analyzed_result, :jsonb, default: {}
  end
end
