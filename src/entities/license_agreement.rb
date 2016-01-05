class LicenseAgreement
  attr_accessor :rh1, :rh2, :royalty_percentage, :bi_percentage

  def initialize rh1:, rh2:, royalty_percentage:, bi_percentage: nil
    @rh1, @rh2, @royalty_percentage, @bi_percentage =
      rh1, rh2, royalty_percentage, bi_percentage
  end

  # def generate_recording_shares total
  #   share = total * @royalty_percentage
  #
  #   if bi_percentage.present?
  #     [
  #       RecordingShare.new(right_holder: rh1, total: share * (1 - @bi_percentage)),
  #       RecordingShare.new(right_holder: "bi", total: share * @bi_percentage)
  #     ]
  #   else
  #     [
  #       RecordingShare.new(right_holder: rh1, total: share)
  #     ]
  #   end
  # end
end
