class AddMatchedKeywordsToRiskMatches < ActiveRecord::Migration[8.0]
  def change
    add_column :risk_matches, :matched_keywords, :jsonb, default: []
  end
end
