module Contracts
  class GenerateRiskReport
    SEVERITY_WEIGHTS = {
      "low" => 1,
      "medium" => 3,
      "high" => 5
    }

    def self.call(contract)
      matches = RiskMatch
        .joins(:clause, :risk_pattern)
        .where(clauses: { contract_id: contract.id })

      return if matches.empty?

      total_score = matches.sum do |match|
        SEVERITY_WEIGHTS[match.risk_pattern.severity] * match.confidence
      end

      normalized = normalize(total_score)

      RiskReport.create!(
        contract: contract,
        risk_score: normalized,
        total_risks: matches.count,
        overall_risk: risk_level(normalized),
        summary: build_summary(matches)
      )
    end

    def self.normalize(raw_score)
      [(raw_score * 10).round, 100].min
    end

    def self.risk_level(score)
      return :high if score >= 70
      return :medium if score >= 40
      :low
    end

    def self.build_summary(matches)
      matches
        .group_by { |m| m.risk_pattern.severity }
        .transform_values(&:count)
    end
  end
end
