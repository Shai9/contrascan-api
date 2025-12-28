module Contracts
  class DetectContractType
    INDICATORS = [
      "terms and conditions",
      "terms of service",
      "by using this service",
      "we may update these terms",
      "continued use constitutes acceptance",
      "user agrees"
    ]

    THRESHOLD = 2

    def self.call(contract)
      text = contract.raw_text.to_s.downcase

      matches = INDICATORS.count { |phrase| text.include?(phrase) }

      contract.update!(
        contract_type: matches >= THRESHOLD ? :terms_and_conditions : :general
      )
    end
  end
end
