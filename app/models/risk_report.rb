class RiskReport < ApplicationRecord
  enum :overall_risk, {
    low: 0,
    medium: 1,
    high: 2
  }

  belongs_to :contract
end