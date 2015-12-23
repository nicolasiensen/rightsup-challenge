require 'spec_helper'

RSpec.describe RecordingRevenues do
  describe "#add_recording_claim" do
    before do
      @recording_revenues = RecordingRevenues.new
      @license_agreement = double("license_agreement")
    end

    it "should add a new recording claim" do
      recording_claim = RecordingClaim.new(
        claimed_percentage: RoyaltyPercentage.new(100),
        license_agreement: @license_agreement
      )

      @recording_revenues.add_recording_claim(recording_claim)
      expect(@recording_revenues.recording_claims).to be_eql([recording_claim])
    end

    it "should raise an error if total claimed percentage exceeds 100%" do
      recording_claim_1 = RecordingClaim.new(
        claimed_percentage: RoyaltyPercentage.new(100),
        license_agreement: @license_agreement
      )

      recording_claim_2 = RecordingClaim.new(
        claimed_percentage: RoyaltyPercentage.new(10),
        license_agreement: @license_agreement
      )

      @recording_revenues.add_recording_claim(recording_claim_1)

      expect do
        @recording_revenues.add_recording_claim(recording_claim_2)
      end.to raise_error MaximumClaimedPercentageError
    end
  end
end
