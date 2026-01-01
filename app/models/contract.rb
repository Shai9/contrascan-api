class Contract < ApplicationRecord
  enum :document_type, {
    general: 0,
    terms_and_conditions: 1
  }

  enum :status, {
    pending: 0,
    processing: 1,
    completed: 2,
    failed: 3
  }

  has_many :clauses, dependent: :destroy
  has_one_attached :file
end