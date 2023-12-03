# frozen_string_literal: true

class CampaignFinance < ApplicationRecord
  attr_accessor :name, :cycle, :category

  CATEGORY_MAPPING = {
    'candidate-loan'      => 'candidate_loans',
    'contribution-total'  => 'total_contributions',
    'debts-owed'          => 'debts_owed',
    'disbursements-total' => 'total_disbursements',
    'end-cash'            => 'end_cash',
    'individual-total'    => 'total_from_individuals',
    'pac-total'           => 'total_from_pacs',
    'receipts-total'      => 'total_contributions',
    'refund-total'        => 'total_refunds'
  }.freeze

  def self.propublica_api_to_representatives(rep_info, cycle, category)
    reps = []
    category_key = CATEGORY_MAPPING[category] || category

    rep_info['results'].each do |rep_stuff|
      name = rep_stuff['name']
      category_value = rep_stuff[category_key]
      rep = CampaignFinance.new(name: name, cycle: cycle, category: category_value)
      reps.push(rep)
    end
    reps
  end
end
