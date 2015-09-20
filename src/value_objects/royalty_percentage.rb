class RoyaltyPercentage
  attr_accessor :value

  def initialize value
    @value = value
  end

  def eql? royalty_percentage
    royalty_percentage.value == self.value
  end

  def * float_number
    float_number * (self.value/100)
  end
end
