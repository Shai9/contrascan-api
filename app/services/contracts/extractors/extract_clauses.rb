module Contracts
  class ExtractClauses
    SECTION_REGEX = /
      (?=\n\d+(\.\d+)*\s) |       
      (?=\n[A-Z][A-Z\s]{5,})      
    /x

    def self.call(contract)
      return if contract.raw_text.blank?

      contract.clauses.delete_all

      clauses = contract.raw_text
                        .split(SECTION_REGEX)
                        .map(&:strip)
                        .reject(&:blank?)

      clauses.each_with_index do |text, index|
        contract.clauses.create!(
          text: text,
          position: index + 1
        )
      end
    end
  end
end
