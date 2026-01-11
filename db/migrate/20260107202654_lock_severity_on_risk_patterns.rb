class LockSeverityOnRiskPatterns < ActiveRecord::Migration[8.0]
  def change
    change_column_default :risk_patterns, :severity, 1
    change_column_null :risk_patterns, :severity, false
  end
end