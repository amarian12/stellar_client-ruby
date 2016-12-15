require 'spec_helper'

module BridgeClient
  RSpec.describe SendPaymentRequest, type: %i[virtus] do

    it "inherits from BaseRequest" do
      expect(SendPaymentRequest < BaseRequest).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:destination, String) }
      it { is_expected.to have_attribute(:amount, Float) }
      it { is_expected.to have_attribute(:asset_code, String) }
      it { is_expected.to have_attribute(:asset_issuer, String) }
      it { is_expected.to have_attribute(:memo_type, String) }
      it { is_expected.to have_attribute(:memo, String) }
    end

    describe "#body" do
      it "is required fields" do
        request = described_class.new(
          destination: "GWASKA",
          amount: 251.0,
          asset_code: "PHP",
          asset_issuer: "GALACA",
          memo_type: "text",
          memo: "meme",
        )

        body = request.body
        expect(body[:destination]).to eq "GWASKA"
        expect(body[:amount]).to eq 251.0
        expect(body[:asset_code]).to eq "PHP"
        expect(body[:asset_issuer]).to eq "GALACA"
        expect(body[:memo_type]).to eq "text"
        expect(body[:memo]).to eq "meme"
      end
    end

  end
end