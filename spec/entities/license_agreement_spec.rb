require 'spec_helper'

RSpec.describe LicenseAgreement do
  it 'has two right holders and one royalty percentage' do
    rightsup = RightHolder.new('rightsup')
    rh1 = RightHolder.new('rh1')
    royalty_percentage = RoyaltyPercentage.new(20.0)
    license_agreement = LicenseAgreement.new(rh1, rightsup, royalty_percentage)

    expect(license_agreement.rh1).to be_eql(rh1)
    expect(license_agreement.rh2).to be_eql(rightsup)
    expect(license_agreement.royalty_percentage).to be_eql(royalty_percentage)
  end

  it 'could have a business introducer' do
    rightsup = RightHolder.new('rightsup')
    rh2 = RightHolder.new('rh2')
    royalty_percentage = RoyaltyPercentage.new(20.0)
    bi_percentage = RoyaltyPercentage.new(50.0)

    license_agreement = LicenseAgreement.new(
      rh2,
      rightsup,
      royalty_percentage,
      bi_percentage
    )

    expect(license_agreement.bi_percentage).to be_eql(bi_percentage)
  end
end
