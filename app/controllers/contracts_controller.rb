module Api
  module V1
    class ContractsController < ApplicationController
      def create
        contract = Contract.create!(
          document_type: params[:document_type],
          file: params[:file],
          status: :pending
        )

        ProcessContractJob.perform_later(contract.id)

        render json: {
          id: contract.id,
          status: contract.status
        }, status: :accepted
      end

      def show
        contract = Contract.find(params[:id])

        render json: {
          id: contract.id,
          status: contract.status,
          risks: contract.clauses.flat_map do |clause|
            clause.risk_matches.map do |rm|
              {
                clause: clause.summary,
                risk: rm.risk_pattern.name,
                severity: rm.risk_pattern.severity,
                confidence: rm.confidence
              }
            end
          end
        }
      end
    end
  end
end
