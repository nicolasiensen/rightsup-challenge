class RecordingRevenue
  attr_accessor :claimed_percentage, :total, :recording_claims, :recording_shares

  def initialize claimed_percentage:, total:, recording_claims:
    if (recording_claims.map{|rc| rc.claimed_percentage}.inject(&:+) || 0) > 100
      raise "Recording claims can't exceed 100%"
    end

    @claimed_percentage = claimed_percentage
    @total = total
    @recording_claims = recording_claims
    @recording_shares = []

    recording_claims.each do |rc|
      @recording_shares.concat rc.share_revenue(total)
    end
  end
end
