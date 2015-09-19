require 'rspec'
require "#{File.dirname(__FILE__)}/../src/right_holder"

RSpec.describe RightHolder do
  it 'has a name' do
    rightsup = RightHolder.new('rightsup')
    expect(rightsup.name).to be_eql('rightsup')
  end
end
