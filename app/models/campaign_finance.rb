# frozen_string_literal: true

class CampaignFinance < ApplicationRecord
  attr_accessor :cycle, :category

  def self.propublica_api_to_representatives(rep_info, category)
    reps = []

    rep_info["results"].each do |rep_stuff|
      name = rep_stuff["name"]
      category_value = rep_stuff["#{category}"]
      rep = {name: name, category: category_value}
      reps.push(rep)
    end
    reps
  end
end