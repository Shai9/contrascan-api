class AddSummaryToClauses < ActiveRecord::Migration[8.0]
  def change
    add_column :clauses, :summary, :text
  end
end
