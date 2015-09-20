require 'spec_helper'

RSpec.describe LicenseAgreement do
  before do
    @rh1 = RightHolder.new('rh1')
    @rightsup = RightHolder.new('rightsup')
    @royalty_percentage = RoyaltyPercentage.new(20.0)
  end

  subject do
    LicenseAgreement.new(
      rh1: @rh1,
      rh2: @rightsup,
      royalty_percentage: @royalty_percentage
    )
  end

  it 'has a first right holder' do
    expect(subject.rh1).to be_eql(@rh1)
  end

  it 'has a second right holder' do
    expect(subject.rh2).to be_eql(@rightsup)
  end

  it 'has a royalty percentage' do
    expect(subject.royalty_percentage).to be_eql(@royalty_percentage)
  end

  it 'could have a business introducer percentage' do
    bi_percentage = RoyaltyPercentage.new(50.0)

    license_agreement = LicenseAgreement.new(
      rh1: @rh1,
      rh2: @rightsup,
      royalty_percentage: @royalty_percentage,
      bi_percentage: bi_percentage
    )

    expect(license_agreement.bi_percentage).to be_eql(bi_percentage)
  end
end
