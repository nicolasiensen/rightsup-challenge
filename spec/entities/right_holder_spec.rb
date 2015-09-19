require 'spec_helper'

RSpec.describe RightHolder do
  it 'has a name' do
    rightsup = RightHolder.new('rightsup')
    expect(rightsup.name).to be_eql('rightsup')
  end
end
