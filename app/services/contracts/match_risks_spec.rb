require "rails_helper"

RSpec.describe Contracts::MatchRisks do
  describe ".call" do
    let!(:contract) do
      Contract.create!(document_type: "nda")
    end

    let!(:clause) do
      Clause.create!(
        contract: contract,
        text: "The company assumes unlimited liability with no limitation of damages."
      )
    end

    let!(:risk_pattern) do
      RiskPattern.create!(
        name: "Unlimited Liability",
        contract_type: "nda",
        keywords: ["unlimited liability", "no limitation"]
      )
    end

    before do
      RiskMatch.delete_all
    end

    it "creates risk matches when keywords are present" do
      expect {
        described_class.call(contract)
      }.to change(RiskMatch, :count).from(0).to(2)

      matches = RiskMatch.all

      expect(matches.map(&:matched_keywords).flatten)
        .to include("unlimited liability", "no limitation")

      matches.each do |match|
        expect(match.confidence).to eq(0.33)
        expect(match.clause).to eq(clause)
        expect(match.risk_pattern).to eq(risk_pattern)
      end
    end
  end
end