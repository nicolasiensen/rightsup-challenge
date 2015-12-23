class RoyaltyPercentage
  attr_accessor :value

  def initialize value
    float_value = value.to_f
    raise "Value can't be less than 0" if float_value < 0
    raise "Value can't be greater than 100" if float_value > 100
    @value = float_value
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
end
