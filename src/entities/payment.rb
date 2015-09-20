# It was not clear, in the problem definition, what should be the name of
# this entity. In order to avoid a class named RecordingRevenue with a method
# with the same name recording_revenue, I decided to name the entity Payment

class Payment
  attr_accessor :title, :artist, :claimed_percentage, :recording_revenues

  def initialize title:, artist:, claimed_percentage:, recording_revenues:
    @title, @artist, @claimed_percentage, @recording_revenues =
      title, artist, claimed_percentage, recording_revenues
  end
end
