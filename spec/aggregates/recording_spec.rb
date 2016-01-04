require 'spec_helper'

RSpec.describe Recording do
  describe "#add_claim" do
    before do
      @recording = Recording.new
      @rh = double("right_holder")
    end

    it "should add a new recording claim" do
      recording_claim = RecordingClaim.new(
        claimed_percentage: RoyaltyPercentage.new(100),
        right_holder: @rh
      )

      @recording.add_claim(recording_claim)
      expect(@recording.claims).to be_eql([recording_claim])
    end

    it "should not add a new recording claim if it sums more than 100%" do
      recording_claim_1 = RecordingClaim.new(
        claimed_percentage: RoyaltyPercentage.new(100),
        right_holder: @rh
      )

      recording_claim_2 = RecordingClaim.new(
        claimed_percentage: RoyaltyPercentage.new(10),
        right_holder: @rh
      )

      @recording.add_claim(recording_claim_1)

      expect do
        @recording.add_claim(recording_claim_2)
      end.to raise_error "Value can't be greater than 100"
    end
  end
end
