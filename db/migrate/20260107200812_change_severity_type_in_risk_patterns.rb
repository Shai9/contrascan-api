class ChangeSeverityTypeInRiskPatterns < ActiveRecord::Migration[8.0]
  def up
    # remove default if any
    execute "ALTER TABLE risk_patterns ALTER COLUMN severity DROP DEFAULT"

    # convert string → integer
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
  end

  def down
    execute <<~SQL
      ALTER TABLE risk_patterns
      ALTER COLUMN severity
      TYPE character varying
      USING CASE severity
        WHEN 0 THEN 'low'
        WHEN 1 THEN 'medium'
        WHEN 2 THEN 'high'
      END
    SQL
  end
end