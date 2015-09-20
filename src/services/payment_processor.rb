module PaymentProcessor
  def self.distribute_revenue payment:, recording_shares:
    result = {}

    recording_shares.each do |recording_share|
      license_agreement = recording_share.license_agreement
      rh1_symbol = license_agreement.rh1.name.to_sym
      rh2_symbol = license_agreement.rh2.name.to_sym

      # Calculate total revenue and commission
      rh_total_revenue = recording_share.claimed_percentage * payment.recording_revenues
      total_commission = license_agreement.royalty_percentage * rh_total_revenue
      rh_final_balance = rh_total_revenue - total_commission

      # Calculate BI's commission if there is one
      bi_commission = (license_agreement.bi_percentage || 0) * total_commission
      commission = total_commission - bi_commission

      # Update the result
      result[rh1_symbol] = rh_final_balance
      result[rh2_symbol] = commission + (result[rh2_symbol] || 0)
      result[:bi] = bi_commission + (result[:bi] || 0)
    end

    result
  end
end
