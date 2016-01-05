require 'spec_helper'

RSpec.describe RecordingRevenue do
  it "should raise an exception if the recording claims exceed 100%" do
    expect do
      RecordingRevenue.new(
        claimed_percentage: RoyaltyPercentage.new(100.0),
        total: 100.0,
        recording_claims: [
          double("recording_claim", claimed_percentage: RoyaltyPercentage.new(100.0)),
          double("recording_claim", claimed_percentage: RoyaltyPercentage.new(100.0))
        ]
      )
    end.to raise_error("Recording claims can't exceed 100%")
  end
end
