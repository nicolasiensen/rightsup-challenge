require 'spec_helper'

RSpec.describe RecordingClaim do
  before do
    @rh = double('RightHolder')
    @recording_share_returned_by_license_agreement = double('RecordingShare', total: 10.0)
    @license_agreement = double(
      'LicenseAgreement',
      share_revenue: [@recording_share_returned_by_license_agreement]
    )
  end

  subject do
    RecordingClaim.new(
      claimed_percentage: RoyaltyPercentage.new(50.0),
      right_holder: @rh,
      license_agreement: @license_agreement
    )
  end

  it 'has a claimed percentage' do
    expect(subject.claimed_percentage).to be_eql(RoyaltyPercentage.new(50.0))
  end

  it 'has a right holder' do
    expect(subject.right_holder).to be_eql(@rh)
  end

  describe '#share_revenue' do
    it 'should return a recording share with a total of 40.0' do
      recording_shares = subject.share_revenue(100.0)
      expect(recording_shares.last.total).to be_eql(40.0)
    end

    it 'should return a recording share for the respective right holder' do
      recording_shares = subject.share_revenue(100.0)
      expect(recording_shares.last.right_holder).to be_eql(@rh)
    end

    it 'should return the recording shares returned by the license agreement' do
      recording_shares = subject.share_revenue(100.0)
      expect(recording_shares).to include(@recording_share_returned_by_license_agreement)
    end
  end
end
