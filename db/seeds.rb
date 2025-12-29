RiskPattern.create!(
  name: "Unilateral Termination",
  description: "The company may terminate the service without notice or cause.",
  severity: :high,
  contract_type: :terms_and_conditions,
  keywords: ["terminate at any time", "without notice", "sole discretion"]
)

RiskPattern.create!(
  name: "Limitation of Liability",
  description: "Limits liability to a small amount or excludes damages.",
  severity: :high,
  contract_type: :terms_and_conditions,
  keywords: ["limit liability", "not liable", "maximum extent permitted"]
)
