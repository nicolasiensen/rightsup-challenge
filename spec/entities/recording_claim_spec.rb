require 'spec_helper'

RSpec.describe RecordingClaim do
  before do
    @rh = double('RightHolder')
  end

  subject do
    RecordingClaim.new(
      claimed_percentage: RoyaltyPercentage.new(50.0),
      right_holder: @rh,
      license_agreement: double('LicenseAgreement', generate_recording_shares: [])
    )
  end

  it 'has a claimed percentage' do
    expect(subject.claimed_percentage).to be_eql(RoyaltyPercentage.new(50.0))
  end

  it 'has a right holder' do
    expect(subject.right_holder).to be_eql(@rh)
  end

  describe '#generate_recording_shares' do
    it 'should return a recording share with a total of 50.0' do
      recording_shares = subject.generate_recording_shares(100.0)
      expect(recording_shares.first.total).to be_eql(50.0)
    end

    it 'should return a recording share for the respective right holder' do
      recording_shares = subject.generate_recording_shares(100.0)
      expect(recording_shares.first.right_holder).to be_eql(@rh)
    end
  end
end
