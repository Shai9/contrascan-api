class AddDescriptionToRiskPatterns < ActiveRecord::Migration[8.0]
  def change
    add_column :risk_patterns, :description, :text
  end
end
