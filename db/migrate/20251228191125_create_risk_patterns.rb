class CreateRiskPatterns < ActiveRecord::Migration[8.0]
  def change
    create_table :risk_patterns do |t|
      t.string :name
      t.string :category
      t.string :severity
      t.text :keywords
      t.integer :applies_to
      t.string :ai_label
      t.text :user_facing_explanation

      t.timestamps
    end
  end
end
