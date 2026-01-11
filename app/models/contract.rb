class Contract < ApplicationRecord
  has_many :clauses, dependent: :destroy
  has_one :risk_report, dependent: :destroy

  enum :status, {
    pending: 0,
    processing: 1,
    completed: 2,
    failed: 3
  }

  enum :document_type, {
    terms_and_conditions: 0,
    privacy_policy: 1
  }
end