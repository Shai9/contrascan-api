class RiskPattern < ApplicationRecord
  enum :severity, { low: 0, medium: 1, high: 2 }
  enum :contract_type, { general: 0, terms_and_conditions: 1 }

  serialize :keywords, coder: JSON

  validates :name, :severity, :contract_type, presence: true
end

