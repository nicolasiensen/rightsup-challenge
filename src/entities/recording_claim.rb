# This entity was created to hold together the right holder's share on a recording,
# along with the respective license agreement with Right's Up

class RecordingClaim
  attr_accessor :claimed_percentage, :right_holder

  def initialize claimed_percentage:, right_holder:, license_agreement:
    @claimed_percentage, @right_holder, @license_agreement =
      claimed_percentage, right_holder, license_agreement
  end

  def share_revenue total
    artist_share = total * @claimed_percentage
    recording_shares = @license_agreement.share_revenue(artist_share)
    license_agreement_share = recording_shares.map{|rs| rs.total}.inject(&:+)

    recording_shares << RecordingShare.new(
      right_holder: @right_holder,
      total: artist_share - license_agreement_share
    )

    return recording_shares
  end
end
