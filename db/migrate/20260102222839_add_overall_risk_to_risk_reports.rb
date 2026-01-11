class AddOverallRiskToRiskReports < ActiveRecord::Migration[8.0]
  def change
    add_column :risk_reports, :overall_risk, :integer
  end
end
