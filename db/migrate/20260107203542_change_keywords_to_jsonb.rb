class ChangeKeywordsToJsonb < ActiveRecord::Migration[8.0]
  def up
    change_column_default :risk_patterns, :keywords, nil

    change_column :risk_patterns,
                  :keywords,
                  :jsonb,
                  using: 'to_jsonb(keywords)'

    change_column_default :risk_patterns, :keywords, []
  end

  def down
    change_column_default :risk_patterns, :keywords, nil

    change_column :risk_patterns,
                  :keywords,
                  :string,
                  array: true,
                  using: 'ARRAY(SELECT jsonb_array_elements_text(keywords))'

    change_column_default :risk_patterns, :keywords, []
  end
end