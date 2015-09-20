class RoyaltyPercentage
  attr_accessor :value

  def initialize value
    @value = value
  end

  def eql? royalty_percentage
    royalty_percentage.value == self.value
  end
end
