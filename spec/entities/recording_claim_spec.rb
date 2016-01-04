require 'spec_helper'

RSpec.describe RecordingClaim do
  before do
    @rh = double('RightHolder')
  end

  subject do
    RecordingClaim.new(
      claimed_percentage: RoyaltyPercentage.new(50.0),
      right_holder: @rh
    )
  end

  it 'has a claimed percentage' do
    expect(subject.claimed_percentage).to be_eql(RoyaltyPercentage.new(50.0))
  end

  it 'has a right holder' do
    expect(subject.right_holder).to be_eql(@rh)
  end
end
