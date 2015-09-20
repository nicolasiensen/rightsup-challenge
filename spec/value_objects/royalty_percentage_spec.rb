require 'spec_helper'

RSpec.describe RoyaltyPercentage do
  subject { RoyaltyPercentage.new(20.0) }

  it 'has a value' do
    expect(subject.value).to be_eql(20.0)
  end

  describe '#eql?' do
    it 'is true if the value of the parameter is equal' do
      param = double('param', value: 20.0)
      expect(subject.eql?(param)).to be_truthy
    end

    it 'is false if the value of the parameter is not equal' do
      param = double('param', value: 100.0)
      expect(subject.eql?(param)).to be_falsey
    end
  end
end
