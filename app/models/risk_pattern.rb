class RiskPattern < ApplicationRecord
  enum applies_to: {
    general: 0,
    terms_and_conditions: 1,
    both: 2
  }

  serialize :keywords, Array
end

