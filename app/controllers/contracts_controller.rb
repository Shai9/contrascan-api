class ContractsController < ApplicationController
  def create
    contract = Contract.create!(
      title: params[:title],
      file: params[:file],
      status: "uploaded"
    )

    render json: { id: contract.id, status: contract.status }, status: :created
  end
end

