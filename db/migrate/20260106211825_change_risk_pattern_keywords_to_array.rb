class ChangeRiskPatternKeywordsToArray < ActiveRecord::Migration[8.0]
  def up
    add_column :risk_patterns, :keywords_array, :string, array: true, default: []

  execute <<~SQL
      UPDATE risk_patterns
      SET keywords_array =
        CASE
          WHEN keywords IS NULL OR keywords = ''
          THEN '{}'
          ELSE ARRAY(
            SELECT jsonb_array_elements_text(keywords::jsonb)
          )
        END
    SQL

    remove_column :risk_patterns, :keywords

    rename_column :risk_patterns, :keywords_array, :keywords
  end

  def down
    add_column :risk_patterns, :keywords_text, :text

    execute <<~SQL
      UPDATE risk_patterns
      SET keywords_text = keywords::text
    SQL

    remove_column :risk_patterns, :keywords
    rename_column :risk_patterns, :keywords_text, :keywords
  end
end
