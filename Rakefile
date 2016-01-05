require './src/rights_up_challenge'

task :example do
  rh1 = RightHolder.new("rh1")
  rh2 = RightHolder.new("rh2")
  rightsup = RightHolder.new("RightsUp")

  license_agreement_1 = LicenseAgreement.new(
    rh1: rh1,
    rh2: rightsup,
    royalty_percentage: RoyaltyPercentage.new(20.0)
  )

  license_agreement_2 = LicenseAgreement.new(
    rh1: rh2,
    rh2: rightsup,
    royalty_percentage: RoyaltyPercentage.new(20.0),
    bi_percentage: RoyaltyPercentage.new(50.0)
  )

  recording_claim_1 = RecordingClaim.new(
    claimed_percentage: RoyaltyPercentage.new(50.0),
    right_holder: rh1,
    license_agreement: license_agreement_1
  )

  recording_claim_2 = RecordingClaim.new(
    claimed_percentage: RoyaltyPercentage.new(50.0),
    right_holder: rh2,
    license_agreement: license_agreement_2
  )

  recording_revenue = RecordingRevenue.new(
    claimed_percentage: RoyaltyPercentage.new(100.0),
    total: 100.0,
    recording_claims: [recording_claim_1, recording_claim_2]
  )

  puts recording_revenue.recording_shares.inspect
end
