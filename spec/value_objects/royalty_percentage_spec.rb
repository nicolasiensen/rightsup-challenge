require 'spec_helper'

RSpec.describe RoyaltyPercentage do
  it 'has a value' do
    royalty_percentage = RoyaltyPercentage.new(20.0)
    expect(royalty_percentage.value).to be_eql(20.0)
  end
end
