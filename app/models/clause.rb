class Clause < ApplicationRecord
  belongs_to :contract

  has_many :risk_matches, dependent: :destroy
  has_many :risk_patterns, through: :risk_matches
end