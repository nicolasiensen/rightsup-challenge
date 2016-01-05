require 'spec_helper'

RSpec.describe LicenseAgreement do
  before do
    @artist = RightHolder.new('artist')
    @rightsup = RightHolder.new('rightsup')
    @royalty_percentage = RoyaltyPercentage.new(20.0)
  end

  subject do
    LicenseAgreement.new(
      artist: @artist,
      commissioned: @rightsup,
      royalty_percentage: @royalty_percentage
    )
  end

  it 'has a artist' do
    expect(subject.artist).to be_eql(@artist)
  end

  it 'has a commissioned' do
    expect(subject.commissioned).to be_eql(@rightsup)
  end

  it 'has a royalty percentage' do
    expect(subject.royalty_percentage).to be_eql(@royalty_percentage)
  end

  it 'could have a business introducer percentage' do
    bi_percentage = RoyaltyPercentage.new(50.0)

    license_agreement = LicenseAgreement.new(
      artist: @artit,
      commissioned: @rightsup,
      royalty_percentage: @royalty_percentage,
      bi_percentage: bi_percentage
    )

    expect(license_agreement.bi_percentage).to be_eql(bi_percentage)
  end

  describe '#share_revenue' do
    context 'when there is no business introducer' do
      subject {
        LicenseAgreement.new(
          artist: @artit,
          commissioned: @rightsup,
          royalty_percentage: @royalty_percentage
        )
      }

      it 'should return one recording share' do
        expect(subject.share_revenue(50).size).to be_eql(1)
      end

      it 'should return one recording share with total of 10.0' do
        expect(subject.share_revenue(50).first.total).to be_eql(10.0)
      end
    end

    context 'when there is a business introducer' do
      subject {
        LicenseAgreement.new(
          artist: @artit,
          commissioned: @rightsup,
          royalty_percentage: @royalty_percentage,
          bi_percentage: RoyaltyPercentage.new(50.0)
        )
      }

      it 'should return two recording share' do
        expect(subject.share_revenue(50).size).to be_eql(2)
      end

      it 'should return two recording shares with total of 5.0 each' do
        recording_shares = subject.share_revenue(50)

        expect(recording_shares[0].total).to be_eql(5.0)
        expect(recording_shares[1].total).to be_eql(5.0)
      end
    end
  end
end
