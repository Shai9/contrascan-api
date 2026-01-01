class AddDocumentTypeToContracts < ActiveRecord::Migration[8.0]
  def change
    add_column :contracts, :document_type, :integer
  end
end
