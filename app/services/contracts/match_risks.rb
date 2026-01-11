
module Contracts
  class MatchRisks
    CONFIDENCE_PER_KEYWORD = 0.33

    def self.call(contract)
      return if contract.clauses.empty?

      contract.clauses.find_each do |clause|
        match_clause(contract, clause)
      end
    end

    def self.match_clause(contract, clause)
      text = clause.text.downcase

      matched_keywords = extract_keywords_from_text(text)
      return if matched_keywords.empty?

      matched_keywords.each do |keyword|
        RiskPattern
          .where(contract_type: contract.document_type)
          .where("keywords @> ?", [keyword].to_json)
          .find_each do |pattern|

          RiskMatch.create!(
            clause: clause,
            risk_pattern: pattern,
            matched_keywords: [keyword],
            confidence: calculate_confidence(1)
          )
        end
      end
    end

    def self.extract_keywords_from_text(text)
      RiskPattern
        .pluck(:keywords)
        .flatten
        .uniq
        .select { |kw| text.include?(kw.downcase) }
    end

    def self.calculate_confidence(count)
      [(count * CONFIDENCE_PER_KEYWORD), 1.0].min
    end

    private_class_method :match_clause,
                         :extract_keywords_from_text,
                         :calculate_confidence
  end
end
