require 'spec_helper'

RSpec.describe Recording do
  describe "#add_recording_shares" do
    before do
      @recording = Recording.new
      @license_agreement = double("license_agreement")
    end

    it "should add a new recording share" do
      recording_share = RecordingShare.new(
        claimed_percentage: RoyaltyPercentage.new(100),
        license_agreement: @license_agreement
      )

      @recording.add_share(recording_share)
      expect(@recording.shares).to be_eql([recording_share])
    end

    it "should not add a new recording share if it sums more than 100%" do
      recording_share_1 = RecordingShare.new(
        claimed_percentage: RoyaltyPercentage.new(100),
        license_agreement: @license_agreement
      )

      recording_share_2 = RecordingShare.new(
        claimed_percentage: RoyaltyPercentage.new(10),
        license_agreement: @license_agreement
      )

      @recording.add_share(recording_share_1)

      expect do
        @recording.add_share(recording_share_2)
      end.to raise_error "Value can't be greater than 100"
    end
  end
end
