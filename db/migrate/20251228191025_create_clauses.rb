class CreateClauses < ActiveRecord::Migration[8.0]
  def change
    create_table :clauses do |t|
      t.references :contract, null: false, foreign_key: true
      t.string :reference
      t.text :text
      t.integer :position_index

      t.timestamps
    end
  end
end
