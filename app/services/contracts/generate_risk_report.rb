module Contracts
  class GenerateRiskReport
    def self.call(contract)
      matches = RiskMatch
                  .joins(:risk_pattern, :clause)
                  .where(clauses: { contract_id: contract.id })
                  .includes(:risk_pattern, :clause)

      grouped = matches.group_by(&:risk_pattern)

      risks = grouped.map do |pattern, pattern_matches|
        {
          name: pattern.name,
          severity: pattern.severity,
          description: pattern.description,
          matches: pattern_matches.map do |match|
            {
              clause_position: match.clause.position,
              excerpt: match.clause.text.truncate(200)
            }
          end
        }
      end

      severity_count = risks.group_by { |r| r[:severity] }.transform_values(&:count)

      {
        contract_id: contract.id,
        contract_type: contract.contract_type,
        summary: {
          total_risks: risks.count,
          high: severity_count["high"] || 0,
          medium: severity_count["medium"] || 0,
          low: severity_count["low"] || 0
        },
        risks: risks.sort_by { |r| severity_rank(r[:severity]) }
      }
    end

    def self.severity_rank(level)
      { "high" => 0, "medium" => 1, "low" => 2 }[level]
    end
  end
end
