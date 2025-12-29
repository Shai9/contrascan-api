class AddContractTypeToRiskPatterns < ActiveRecord::Migration[8.0]
  def change
    add_column :risk_patterns, :contract_type, :integer
  end
end
