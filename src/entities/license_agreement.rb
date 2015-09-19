class LicenseAgreement
  attr_accessor :rh1, :rh2, :royalty_percentage

  def initialize rh1, rh2, royalty_percentage
    @rh1, @rh2, @royalty_percentage = rh1, rh2, royalty_percentage
  end
end
