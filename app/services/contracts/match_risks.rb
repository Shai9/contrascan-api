module Contracts
  class MatchRisks
    def self.call(contract)
      patterns = RiskPattern.where(contract_type: contract.contract_type)

      contract.clauses.each do |clause|
        patterns.each do |pattern|
          pattern.keywords.each do |keyword|
            if clause.text.downcase.include?(keyword.downcase)
              RiskMatch.create!(
                clause: clause,
                risk_pattern: pattern,
                matched_text: keyword
              )
              break
            end
          end
        end
      end
    end
  end
end
