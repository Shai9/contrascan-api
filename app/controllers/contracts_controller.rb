class ContractsController < ApplicationController
  def create
    contract = Contract.create!(
      title: params.require(:title),
      file:  params.require(:file),
      status: "uploaded"
    )

    Contracts::ExtractText.call(contract)
    Contracts::DetectContractType.call(contract)

    render json: {
      id: contract.id,
      status: contract.status,
      contract_type: contract.contract_type
    }, status: :created
  end
end
