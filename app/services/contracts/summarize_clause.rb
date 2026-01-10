module Contracts
  class SummarizeClause
    def self.call(clause)
      return if clause.summary.present?

      clause.update!(
        summary: clause.text.truncate(200)
      )
    end
  end
end