class AddSentinmentAnalysisResultColumnToPayloadsTable < ActiveRecord::Migration[8.0]
  def change
    add_column :payloads, :sentiment_analysis_result, :jsonb, default: {}
  end
end
