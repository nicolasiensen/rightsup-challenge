require 'spec_helper'

RSpec.describe Payment do
  subject do
    Payment.new(
      title: 'Yesterday',
      artist: 'The Beatles',
      claimed_percentage: RoyaltyPercentage.new(100.0),
      recording_revenues: 100.0
    )
  end

  it 'has a title' do
    expect(subject.title).to be_eql('Yesterday')
  end

  it 'has a artist' do
    expect(subject.artist).to be_eql('The Beatles')
  end

  it 'has a claimed percentage' do
    expect(subject.claimed_percentage).to be_eql(RoyaltyPercentage.new(100.0))
  end

  it 'has a recording revenues' do
    expect(subject.recording_revenues).to be_eql(100.0)
  end
end
