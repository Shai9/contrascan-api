RiskPattern.create!([
  {
    name: "Unlimited Liability",
    description: "No cap on liability exposure",
    severity: :high,
    contract_type: :terms_and_conditions,
    keywords: ["unlimited liability", "no limitation", "full liability"]
  },
  {
    name: "Termination Without Notice",
    description: "Allows termination without prior notice",
    severity: :medium,
    contract_type: :terms_and_conditions,
    keywords: ["terminate at any time", "without notice", "immediate termination"]
  },
  {
    name: "Automatic Renewal",
    description: "Contract renews automatically unless cancelled",
    severity: :low,
    contract_type: :general,
    keywords: ["automatic renewal", "auto-renew", "renews automatically"]
  }
])
