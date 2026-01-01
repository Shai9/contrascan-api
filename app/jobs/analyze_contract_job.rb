class AnalyzeContractJob < ApplicationJob
  queue_as :default

  def perform(contract_id)
    contract = Contract.find(contract_id)

    contract.processing!

    Contracts::ExtractText.call(contract)
    Contracts::Extractors::Clauses.call(contract)
    Contracts::DetectRisks.call(contract)

    contract.completed!
  rescue => e
    contract.failed!
    raise e
  end
end
