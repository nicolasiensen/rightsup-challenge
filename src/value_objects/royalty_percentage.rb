class RoyaltyPercentage < Numeric
  attr_accessor :value

  def initialize value
    @value = value.to_f
  end

  def eql? royalty_percentage
    royalty_percentage.value == self.value
  end

  def * float_number
    float_number * (self.value/100)
  end

  def + royalty_percentage
    new_value = royalty_percentage.value + self.value
    RoyaltyPercentage.new(new_value)
  end

  def > number
    @value > number
  end

  def to_f
    @value/100
  end
end
