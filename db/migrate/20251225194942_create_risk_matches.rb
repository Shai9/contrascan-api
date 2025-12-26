class CreateRiskMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :risk_matches do |t|
      t.references :clause, null: false, foreign_key: true
      t.references :risk_pattern, null: false, foreign_key: true
      t.float :confidence
      t.text :explanation

      t.timestamps
    end
  end
end
