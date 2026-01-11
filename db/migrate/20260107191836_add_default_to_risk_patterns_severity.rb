class AddDefaultToRiskPatternsSeverity < ActiveRecord::Migration[8.0]
  def up
    change_column_default :risk_patterns, :severity, nil

    execute <<~SQL
      ALTER TABLE risk_patterns
      ALTER COLUMN severity
      TYPE integer
      USING CASE severity
        WHEN 'low' THEN 0
        WHEN 'medium' THEN 1
        WHEN 'high' THEN 2
        ELSE 1
      END
    SQL

    change_column_default :risk_patterns, :severity, 1
  end

  def down
    change_column :risk_patterns, :severity, :string
  end
end
