# This entity was created to hold together the right holder's share on a recording,
# along with the respective license agreement with Right's Up

class RecordingClaim
  attr_accessor :claimed_percentage, :right_holder

  def initialize claimed_percentage:, right_holder:
    @claimed_percentage, @right_holder =
      claimed_percentage, right_holder
  end
end
