class LicenseAgreement
  attr_accessor :rh1, :rh2, :royalty_percentage, :bi_percentage

  def initialize rh1:, rh2:, royalty_percentage:, bi_percentage: nil
    @rh1, @rh2, @royalty_percentage, @bi_percentage =
      rh1, rh2, royalty_percentage, bi_percentage
  end
end
