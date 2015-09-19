require 'rspec'
require "#{File.dirname(__FILE__)}/../src/royalty_percentage"

RSpec.describe RoyaltyPercentage do
  it 'has a value' do
    royalty_percentage = RoyaltyPercentage.new(20.0)
    expect(royalty_percentage.value).to be_eql(20.0)
  end
end
