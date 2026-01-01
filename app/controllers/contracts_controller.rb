class ContractsController < ApplicationController
  def create
    contract = Contract.create!(
      contract_params.merge(status: :pending)
    )

    AnalyzeContractJob.perform_later(contract.id)

    render json: {
      id: contract.id,
      status: contract.status
    }, status: :accepted
  end

  def show
      contract = Contract.find(params[:id])

      render json: {
        id: contract.id,
        status: contract.status
      }
  end


  def report
    contract = Contract.find(params[:id])

    report = Contracts::GenerateRiskReport.call(contract)

    render json: report
  end
end
