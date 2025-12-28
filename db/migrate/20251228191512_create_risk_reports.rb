class CreateRiskReports < ActiveRecord::Migration[8.0]
  def change
    create_table :risk_reports do |t|
      t.references :contract, null: false, foreign_key: true
      t.integer :total_risks
      t.float :risk_score
      t.jsonb :summary

      t.timestamps
    end
  end
end
