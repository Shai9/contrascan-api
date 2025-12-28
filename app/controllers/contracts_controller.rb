class ContractsController < ApplicationController
  def create
    contract = Contract.create!(
      title: params.require(:title),
      file:  params.require(:file),
      status: "uploaded"
    )

    render json: {
      id: contract.id,
      status: contract.status
    }, status: :created
  end
end
