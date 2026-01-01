class AddStatusToContracts < ActiveRecord::Migration[8.0]
  def change
    add_column :contracts, :status, :integer
  end
end
