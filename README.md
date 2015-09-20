## Install
Given that you already have [Ruby](https://www.ruby-lang.org/pt/) and [Git](https://git-scm.com/) installed.

```
git clone git@github.com:nicolasiensen/rightsup-challenge.git
cd rightsup-challenge
bundle install
```

## Usage
You can use Interactive Ruby (irb) to play with Right's Up Challenge solution.

Start the irb console inside the project's folder and then run the following:
```
require "#{Dir.pwd}/src/rights_up_challenge"
```

Now you can use all entities, value objects and services of the product

### Value Objects
#### RoyaltyPercentage
It represents a percentage number, used to process revenues shares.

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

#### RecordingShare
This class is responsible keep a ```claimed_percentage``` attached to a ```LicenseAgreement``` on the revenues of a recording.

```ruby
RecordingShare.new(
  claimed_percentage: RoyaltyPercentage.new(50.0),
  license_agreement: @license_agreement
)
```

The ```RecordingShare``` created above tells us that the ```@license_agreement``` should be applied for 50% of the total revenue of a recording.

#### Payment
This class represents the received money from a collecting agency

```ruby
Payment.new(
  title: 'Yesterday',
  artist: 'The Beatles',
  claimed_percentage: RoyaltyPercentage.new(100.0),
  recording_revenues: 100.0
)
```

### Services
#### PaymentProcessor
This module have a single method called ```distribute_revenue```, this method receives a ```Payment``` object and an array of ```RecordingShare```'s.

```ruby
PaymentProcessor.distribute_revenue(
  payment: @payment,
  recording_shares: [@recording_share]
)
```

As a result, ```PaymentProcessor.distribute_revenue``` will return a hash representing the distribution:

```ruby
{
  rh1: 40.0,
  rh2: 40.0,
  rightsup: 15.0,
  bi: 5.0
}
```

## Observations
### RoyaltyCurrency
In the current version the solution is using plain floating numbers to represent currency, but in the future we could implement a class called ```RoyaltyCurrency``` to represent all the currencies in the project.

### Claimed percentage in the received money table
In the [problem definition](https://docs.google.com/document/d/1MKeYuvyc5Vv7fV6X2XKRmw-PkrE3KMIOV5e_d2qP0y0/edit#), there is an attribute for the received money called ```claimed percentage```. It was not clear how this percentage should be used in the distribution of the recording revenues, so in this version we are ignoring this attribute.

### ```Payment``` entity
It was really painful to decide which name this entity should assume, ```Income```, ```RecordingRevenue``` or just ```Revenue```. In the end ```Payment``` seemed to better represent the meaning of this entity purpose, but we can still argue on that.

## Tests
When inside of the project's folder:

```
rspec spec
```
