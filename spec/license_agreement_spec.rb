require 'rspec'
require "#{File.dirname(__FILE__)}/../src/license_agreement"
require "#{File.dirname(__FILE__)}/../src/royalty_percentage"

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
end
