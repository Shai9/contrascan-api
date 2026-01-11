class ChangeStatusTypeInContracts < ActiveRecord::Migration[8.0]
  def up
    change_column_default :contracts, :status, nil

    execute <<~SQL
      ALTER TABLE contracts
      ALTER COLUMN status
      TYPE integer
      USING CASE status
        WHEN 'pending' THEN 0
        WHEN 'processing' THEN 1
        WHEN 'completed' THEN 2
        WHEN 'failed' THEN 3
        ELSE 0
      END
    SQL

    change_column_default :contracts, :status, 0
  end

  def down
    change_column :contracts, :status, :string
    change_column_default :contracts, :status, 'pending'
  end
end
