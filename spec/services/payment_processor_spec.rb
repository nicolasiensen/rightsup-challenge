require 'spec_helper'

RSpec.describe PaymentProcessor do
  describe '.distribute_revenue' do
    before do
      rh1 = RightHolder.new('rh1')
      rh2 = RightHolder.new('rh2')
      rightsup = RightHolder.new('rightsup')

      @license_agreement_1 = LicenseAgreement.new(
        rh1: rh1,
        rh2: rightsup,
        royalty_percentage: RoyaltyPercentage.new(20.0)
      )

      @license_agreement_2 = LicenseAgreement.new(
        rh1: rh2,
        rh2: rightsup,
        royalty_percentage: RoyaltyPercentage.new(20.0)
      )

      @payment = Payment.new(
        title: 'Yesterday',
        artist: 'The Beatles',
        claimed_percentage: RoyaltyPercentage.new(100.0),
        recording_revenues: 100.0
      )
    end

    context 'there is only one right holder' do
      before do
        @recording_claim = RecordingClaim.new(
          claimed_percentage: RoyaltyPercentage.new(100.0),
          license_agreement: @license_agreement_1
        )
      end

      subject do
        PaymentProcessor.distribute_revenue(
          payment: @payment,
          recording_claims: [@recording_claim]
        )
      end

      it 'distributes all the revenue less the license agreement commission' do
        expect(subject[:rh1]).to be_eql(80.0)
      end

      it 'distributes the license agreement commission' do
        expect(subject[:rightsup]).to be_eql(20.0)
      end
    end

    context 'there are more than one right holder' do
      before do
        @recording_claim_1 = RecordingClaim.new(
          claimed_percentage: RoyaltyPercentage.new(50.0),
          license_agreement: @license_agreement_1
        )

        @recording_claim_2 = RecordingClaim.new(
          claimed_percentage: RoyaltyPercentage.new(50.0),
          license_agreement: @license_agreement_2
        )
      end

      subject do
        PaymentProcessor.distribute_revenue(
          payment: @payment,
          recording_claims: [@recording_claim_1, @recording_claim_2]
        )
      end

      it 'distributes the claimed percentage of revenue less the license agreement commission to the first right holder' do
        expect(subject[:rh1]).to be_eql(40.0)
      end

      it 'distributes the claimed percentage of revenue less the license agreement commission to the second right holder' do
        expect(subject[:rh2]).to be_eql(40.0)
      end

      it 'distributes all the licenses agreements commissions' do
        expect(subject[:rightsup]).to be_eql(20.0)
      end

      context 'there is a business introducer' do
        before do
          @license_agreement_2.bi_percentage = RoyaltyPercentage.new(50.0)
        end

        it 'distributes all the licenses agreements commissions less the business introducer share' do
          expect(subject[:rightsup]).to be_eql(15.0)
        end

        it 'distributes all the business introducers share' do
          expect(subject[:bi]).to be_eql(5.0)
        end
      end
    end
  end
end
