class Recording
  attr_accessor :shares

  def initialize
    self.shares = []
  end

  def add_share share
    begin
      self.total_share_percentage + share.claimed_percentage
      self.shares << share
    end
  end

  def total_share_percentage
    if self.shares.any?
      self.shares.map{|s| s.claimed_percentage}.inject{|sum, c| sum + c}
    else
      RoyaltyPercentage.new(0)
    end
  end
end
