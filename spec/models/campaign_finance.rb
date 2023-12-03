# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

# rubocop:disable RSpec/VerifiedDoubles, Rspec/MessageSpies, RSpec/ExampleLength, Layout/LineLength, Lint/Syntax

describe CampaignFinance do
  describe 'propublica_api_to_representatives'
    before do
      @rep_info = double('rep_info')
    end
    it 'creates representatives from rep_info' do
      allow(@rep_info).to receive(:results).and_return([
        double(name: 'GARDNER, CORY', total_from_individuals: '3527890.7', total_from_pacs: '1706367.74')
        double(name: 'PETERS, GARY', total_from_individuals: '4908369.62', total_from_pacs: '1505646.46')
      ])
    end
  end
end

# rubocop:enable RSpec/VerifiedDoubles, Rspec/MessageSpies, RSpec/ExampleLength, Layout/LineLength, Lint/Syntax