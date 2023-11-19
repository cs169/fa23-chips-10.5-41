require 'rails_helper'
require 'spec_helper'

describe Representative do
  describe 'civic api to representative params' do
    before :each do
      @rep_info = double('rep_info')
      @existing_rep = Representative.create!(name: 'Chris Traeger', ocdid: 'ocd-division/country:us/state:ca/place:example_city', title: 'Clerk')
    end
    it 'creates representatives from rep_info' do
      allow(@rep_info).to receive(:officials).and_return([
        double('official1', name: 'John Doe'),
        double('official2', name: 'Jane Smith')
      ])

      allow(@rep_info).to receive(:offices).and_return([
        double('office1', name: 'Mayor', "official_indices": [0], division_id: 'ocd-division/country:us/state:ca/place:example_city'),
        double('office2', name: 'Governor', "official_indices": [1], division_id: 'ocd-division/country:us/state:ca')
      ])

      expect(Representative).to receive(:create!).with({ name: 'John Doe', ocdid: 'ocd-division/country:us/state:ca/place:example_city', title: 'Mayor' })
      expect(Representative).to receive(:create!).with({ name: 'Jane Smith', ocdid: 'ocd-division/country:us/state:ca', title: 'Governor' })

      Representative.civic_api_to_representative_params(@rep_info)
    end
    it 'doesnt duplicate representatives' do
      allow(@rep_info).to receive(:officials).and_return([
        double('official1', name: 'Chris Traeger')
      ])
  
      allow(@rep_info).to receive(:offices).and_return([
        double('office1', name: 'Clerk', "official_indices": [0], division_id: 'ocd-division/country:us/state:ca/place:example_city')
      ])
  
      expect(@existing_rep).not_to receive(:update!)
      expect(Representative).not_to receive(:create!)
  
      Representative.civic_api_to_representative_params(@rep_info)
    end
  end
end

