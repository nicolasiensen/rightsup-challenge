class LicenseAgreement
  attr_accessor :artist, :commissioned, :royalty_percentage, :bi_percentage

  def initialize artist:, commissioned:, royalty_percentage:, bi_percentage: nil
    @artist, @commissioned, @royalty_percentage, @bi_percentage =
      artist, commissioned, royalty_percentage, bi_percentage
  end

  def share_revenue total
    share = total * @royalty_percentage

    if bi_percentage.nil?
      [
        RecordingShare.new(right_holder: commissioned, total: share)
      ]
    else
      [
        RecordingShare.new(right_holder: commissioned, total: share * (1 - @bi_percentage.to_f)),
        RecordingShare.new(right_holder: "bi", total: share * @bi_percentage)
      ]
    end
  end
end
