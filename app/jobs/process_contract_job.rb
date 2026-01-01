class ProcessContractJob < ApplicationJob
  queue_as :default

  def perform(contract_id)
    contract = Contract.find_by(id: contract_id)
    return unless contract

    contract.processing!

    Contracts::ExtractText.call(contract)
    Contracts::DetectContractType.call(contract)
    Contracts::Extractors::Clauses.call(contract)
    Contracts::MatchRisks.call(contract)
    Contracts::GenerateRiskReport.call(contract)

    contract.completed!
  rescue => e
    contract&.failed!
    Rails.logger.error("[ProcessContractJob] #{e.class}: #{e.message}")
    raise e
  end
end
