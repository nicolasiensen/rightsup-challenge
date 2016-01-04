class Recording
  attr_accessor :claims

  def initialize
    self.claims = []
  end

  def add_claim claim
    begin
      self.total_claim_percentage + claim.claimed_percentage
      self.claims << claim
    end
  end

  def total_claim_percentage
    if self.claims.any?
      self.claims.map{|s| s.claimed_percentage}.inject{|sum, c| sum + c}
    else
      RoyaltyPercentage.new(0)
    end
  end
end
