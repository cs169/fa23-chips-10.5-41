# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe Representative do
  describe 'civic api to representative params' do
    before do
      # Assuming CivicInfoResult is the expected type of the result object
      @civic_info_result_double = instance_double(Google::Apis::CivicinfoV2::CivicInfoResult)
    end

    it 'creates representatives from rep_info' do
      # Now you can set up expectations or stub methods on civic_info_result_double as needed
      allow(@civic_info_result_double).to receive(:officials).and_return([
        instance_double(Google::Apis::CivicinfoV2::Official, name: 'John Doe'),
        instance_double(Google::Apis::CivicinfoV2::Official, name: 'Jane Smith')
      ])

      allow(@civic_info_result_double).to receive(:offices).and_return([
                                                         instance_double(Office, name: 'Mayor', official_indices: [0],
division_id: 'ocd-division/country:us/state:ca/place:example_city'),
                                                         instance_double(Office, name: 'Governor', official_indices: [1],
                                                 division_id: 'ocd-division/country:us/state:ca')
                                                       ])

      expect(described_class).to receive(:create!).with({ name: 'John Doe',
ocdid: 'ocd-division/country:us/state:ca/place:example_city', title: 'Mayor' })
      expect(described_class).to receive(:create!).with({ name: 'Jane Smith', ocdid: 'ocd-division/country:us/state:ca',
title: 'Governor' })

      described_class.civic_api_to_representative_params(@civic_info_result_double)
    end
  end
end
