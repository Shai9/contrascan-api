class RiskMatch < ApplicationRecord
  belongs_to :clause
  belongs_to :risk_pattern
end
