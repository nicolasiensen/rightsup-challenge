## Install
Given that you already have [Ruby](https://www.ruby-lang.org/pt/) and [Git](https://git-scm.com/) installed.

```
git clone git@github.com:nicolasiensen/rightsup-challenge.git
cd rightsup-challenge
bundle install
```

## Tests
When inside of the project's folder:

```
rspec spec
```

## Usage
You can use Interactive Ruby (irb) to play with Right's Up Challenge solution.

Start the irb console inside the project's folder and then run the following:
```
require "#{Dir.pwd}/src/rights_up_challenge"
```

### Value Objects
#### RoyaltyPercentage
It represents a percentage number, used to process revenues distribution.

```ruby
rp = RoyaltyPercentage.new(20.0) # 20%
```

You can multiply this object by a float number, and you will get back the product of the percentage applied to the float number.

```ruby
rp * 100.0 # 20.0
```

### Entities

#### RightHolder
This is a simple class to hold a name for a right holder

```ruby
RightHolder.new('rightsup')
```

#### LicenseAgreement
It's responsible to hold together two ```RightHolder```'s along with a ```RoyaltyPercentage``` to represent the agreement between them.

```ruby
LicenseAgreement.new(
  rh1: @rh1,
  rh2: @rightsup,
  royalty_percentage: @royalty_percentage
)
```

The ```LicenseAgreement``` could also be created with a business introducer:

```ruby
LicenseAgreement.new(
  rh1: @rh1,
  rh2: @rightsup,
  royalty_percentage: @royalty_percentage,
  bi_percentage: RoyaltyPercentage.new(50.0)
)
```

#### RecordingClaim
This class is responsible keep a ```claimed_percentage``` attached to a ```LicenseAgreement```.

```ruby
RecordingClaim.new(
  claimed_percentage: RoyaltyPercentage.new(50.0),
  license_agreement: @license_agreement
)
```

The ```RecordingClaim``` created above tells us that the ```@license_agreement``` should be applied for 50% of the total revenue of a recording.

## Full example
```ruby
require "#{Dir.pwd}/src/rights_up_challenge"
rh1 = RightHolder.new("rh1")
rh2 = RightHolder.new("rh2")
rightsup = RightHolder.new("RightsUp")

license_agreement_1 = LicenseAgreement.new(
  artist: rh1,
  commissioned: rightsup,
  royalty_percentage: RoyaltyPercentage.new(20.0)
)

license_agreement_2 = LicenseAgreement.new(
  artist: rh2,
  commissioned: rightsup,
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

# Returns all recording shares for the given recording revenue
recording_revenue.recording_shares
```

## Observations
### RoyaltyCurrency
In the current version the solution is using plain floating numbers to represent currency, but in the future we could implement a class called ```RoyaltyCurrency``` to represent all the currencies in the project.

### Claimed percentage in the received money table
In the [problem definition](https://docs.google.com/document/d/1MKeYuvyc5Vv7fV6X2XKRmw-PkrE3KMIOV5e_d2qP0y0/edit#), there is an attribute for the received money called ```claimed percentage```. It was not clear how this percentage should be used in the distribution of the recording revenues, so in this version we are ignoring this attribute.

### ```Payment``` entity
It was really painful to decide which name this entity should assume, ```Income```, ```RecordingRevenue``` or just ```Revenue```. In the end ```Payment``` seemed to better represent the meaning of this entity purpose, but we can still argue on that.

### Business introducer as an entity
For now, business introducer is represented by a ```RoyaltyPercentage```, but if needed, we could implement a ```BusinessIntroducer``` entity to keep more information other than it's percentage.

### Aggregates
There was no need to create an aggregate in order to fully accomplish the challenge, but there are some lists that could be managed by some aggregates. Like a list of payments received by collecting agencies or a list of recording claims by right holders.
