class AddDefaultsToContracts < ActiveRecord::Migration[8.0]
  def change
    change_column_default :contracts, :status, 0
    change_column_default :contracts, :document_type, "terms_and_conditions"
  end
end
