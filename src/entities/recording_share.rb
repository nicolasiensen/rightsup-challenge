# This entity was created to hold together the right holder's share on a recording,
# along with the respective license agreement with Right's Up

class RecordingShare
  attr_accessor :claimed_percentage, :license_agreement

  def initialize claimed_percentage:, license_agreement:
    @claimed_percentage, @license_agreement =
      claimed_percentage, license_agreement
  end
end
