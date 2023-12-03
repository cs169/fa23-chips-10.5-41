# frozen_string_literal: true

class CampaignFinance < ApplicationRecord
  has_many :news_items, dependent: :delete_all
  # attr_accessor :name, :cycle, :category

  def self.categories
    {
      'candidate-loan'      => 'candidate_loans',
      'contribution-total'  => 'total_contributions',
      'debts-owed'          => 'debts_owed',
      'disbursements-total' => 'total_disbursements',
      'end-cash'            => 'end_cash',
      'individual-total'    => 'total_from_individuals',
      'pac-total'           => 'total_from_pacs',
      'receipts-total'      => 'total_contributions',
      'refund-total'        => 'total_refunds'
    }
  end

  def self.cycles
    (2010..2020).to_a
  end

  def self.propublica_api_to_representatives(rep_info, cycle, category)
    reps = []
    category_key = categories[category] || category

    rep_info['results'].each do |rep_stuff|
      name = rep_stuff['name']
      category_value = rep_stuff[category_key]
      rep = CampaignFinance.new(name: name, cycle: cycle, category: category_value)
      reps.push(rep)
    end
    reps
  end

  def self.find_from_top_twenty(search_params)
    api_key = '9lcjslvwVjbqtX0KcQQ3W9rFm316caQQ2T89n4xA'
    api_url = "https://api.propublica.org/campaign-finance/v1/#{search_params[:cycle]}/candidates/leaders/#{categories[search_params[:category]]}"
    response = Faraday.get(api_url) do |request|
      request.headers['X-API-Key'] = api_key
    end
    JSON.parse(response.body)['results'].map { |result| result['candidate'] }
  end
end
