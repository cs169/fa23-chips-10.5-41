# frozen_string_literal: true

class CampaignFinance < ApplicationRecord
  attr_accessor :cycle, :category

  def self.propublica_api_to_representatives(rep_info)
    reps = []
  end
end