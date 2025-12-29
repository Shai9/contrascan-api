module Contracts
  module Extractors
    class Clauses
      SECTION_REGEX = /
        (?=\n\d+(\.\d+)*\s) |       
        (?=\n[A-Z][A-Z\s]{5,})   
      /x

      def self.call(contract)
        return if contract.raw_text.blank?

        contract.clauses.delete_all

        raw = contract.raw_text

        clauses =
        if raw.match?(SECTION_REGEX)
            raw.split(SECTION_REGEX)
        else
            raw.split(/\n{2,}/)
        end

        clauses = clauses.map(&:strip).reject(&:blank?)

      end
    end
  end
end
