require 'spec_helper'

RSpec.describe RoyaltyPercentage do
  subject { RoyaltyPercentage.new(20.0) }

  it 'has a value' do
    expect(subject.value).to be_eql(20.0)
  end

  it 'should be greater than 0' do
    expect do
      RoyaltyPercentage.new(-1.0)
    end.to raise_error "Value can't be less than 0"
  end

  it 'should be less than 100' do
    expect do
      RoyaltyPercentage.new(101.0)
    end.to raise_error "Value can't be greater than 100"
  end

  it 'should parse value to float' do
    rp = RoyaltyPercentage.new(50)
    expect(rp.value).to be_eql 50.0

    rp = RoyaltyPercentage.new("50")
    expect(rp.value).to be_eql 50.0
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

  describe '#*' do
    it 'is the multiplication of its percentage by the parameter' do
      expect(subject.*(100)).to be_eql(20.0)
    end
  end

  describe '#+' do
    it 'should return a new RoyaltyPercentage object with the sum of its values' do
      expect(subject + RoyaltyPercentage.new(10)).to be_eql(RoyaltyPercentage.new(30.0))
    end
  end
end
