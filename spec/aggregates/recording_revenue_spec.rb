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

  it "should initialize with no recording share" do
    recording_revenue = RecordingRevenue.new(
      claimed_percentage: RoyaltyPercentage.new(100.0),
      total: 100.0,
      recording_claims: []
    )

    expect(recording_revenue.recording_shares).to be_empty
  end

  it "should initialize with one recording share when there is one recording claim returning one recording share" do
    recording_revenue = RecordingRevenue.new(
      claimed_percentage: RoyaltyPercentage.new(100.0),
      total: 100.0,
      recording_claims: [
        instance_double(
          "RecordingClaim",
          claimed_percentage: RoyaltyPercentage.new(100.0),
          generate_recording_shares: [double("recording_share")]
        )
      ]
    )

    expect(recording_revenue.recording_shares.size).to be_eql(1)
  end

  it "should initialize with two recording shares when there is two recording claims returning one recording share each" do
    recording_revenue = RecordingRevenue.new(
      claimed_percentage: RoyaltyPercentage.new(100.0),
      total: 100.0,
      recording_claims: [
        instance_double(
          "RecordingClaim",
          claimed_percentage: RoyaltyPercentage.new(50.0),
          generate_recording_shares: [double("recording_share")]
        ),
        instance_double(
          "RecordingClaim",
          claimed_percentage: RoyaltyPercentage.new(50.0),
          generate_recording_shares: [double("recording_share")]
        )
      ]
    )

    expect(recording_revenue.recording_shares.size).to be_eql(2)
  end
end
