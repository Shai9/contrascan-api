class Contract < ApplicationRecord
  enum contract_type: {
    general: 0,
    terms_and_conditions: 1
  }

  has_many :clauses, dependent: :destroy
end

