class CreateContracts < ActiveRecord::Migration[8.0]
  def change
    create_table :contracts do |t|
      t.string :title
      t.integer :contract_type
      t.string :status
      t.text :raw_text
      t.text :normalized_text
      t.string :structure

      t.timestamps
    end
  end
end
