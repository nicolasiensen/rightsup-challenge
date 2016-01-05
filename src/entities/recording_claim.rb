# This entity was created to hold together the right holder's share on a recording,
# along with the respective license agreement with Right's Up

class RecordingClaim
  attr_accessor :claimed_percentage, :right_holder

  def initialize claimed_percentage:, right_holder:, license_agreement:
    @claimed_percentage, @right_holder, @license_agreement =
      claimed_percentage, right_holder, license_agreement
  end

  def generate_recording_shares total
    share = total * @claimed_percentage
    # recording_shares = @license_agreement.generate_recording_shares(share)
    recording_shares = []
    recording_shares << RecordingShare.new(
      right_holder: @right_holder,
      total: share #- (recording_shares.map{|rs| ts.total}.inject(&:+) || 0)
    )
    
    return recording_shares
  end
end
