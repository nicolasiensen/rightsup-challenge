class RecordingRevenues
  attr_accessor :recording_claims

  def initialize
    self.recording_claims = []
  end

  def add_recording_claim recording_claim
    if self.total_claimed_percentage.value + recording_claim.claimed_percentage.value <= 100
      self.recording_claims << recording_claim
    else
      raise MaximumClaimedPercentageError, "Claimed percentage can not exceed 100%"
    end
  end

  def total_claimed_percentage
    if self.recording_claims.any?
      self.recording_claims.map{|rc| rc.claimed_percentage}.inject{|sum, c| sum + c}
    else
      RoyaltyPercentage.new(0)
    end
  end
end
