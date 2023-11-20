require 'rails_helper'

RSpec.describe Representative, type: :model do
  it "is valid with valid attributes" do
    representative = Representative.new(
      name: 'John Doe',
      ocdid: 'ocd-division/country:us',
      title: 'Senator',
      street: '123 Main St',
      city: 'Anytown',
      state: 'CA',
      zip: '12345',
      political_party: 'Independent',
      profile: 'A brief profile...'
    )
    expect(representative).to be_valid
  end

end