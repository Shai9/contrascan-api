class RiskPattern < ApplicationRecord
  enum :contract_type, {
    terms_and_conditions: 0,
    privacy_policy: 1
  }

  enum :severity, {
    low: 0,
    medium: 1,
    high: 2
  }

  has_many :risk_matches, dependent: :destroy
  has_many :clauses, through: :risk_matches
end