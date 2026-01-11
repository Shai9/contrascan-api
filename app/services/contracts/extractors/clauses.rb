module Contracts
  module Extractors
    class Clauses
      def self.call(contract)
        return if contract.raw_text.blank?

        clauses = contract.raw_text
                           .split(/\n{2,}/)
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
end
