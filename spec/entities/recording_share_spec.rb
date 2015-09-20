require 'spec_helper'

RSpec.describe RecordingShare do
  before do
    @license_agreement = LicenseAgreement.new(
      rh1: double('RightHolder'),
      rh2: double('RightHolder'),
      royalty_percentage: RoyaltyPercentage.new(20.0)
    )
  end

  subject do
    RecordingShare.new(
      claimed_percentage: RoyaltyPercentage.new(50.0),
      license_agreement: @license_agreement
    )
  end

  it 'has a claimed percentage' do
    expect(subject.claimed_percentage).to be_eql(RoyaltyPercentage.new(50.0))
  end

  it 'has a license agreement' do
    expect(subject.license_agreement).to be_eql(@license_agreement)
  end
end
