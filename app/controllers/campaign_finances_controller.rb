# frozen_string_literal: true

class CampaignFinancesController < ApplicationController
  def index
    @campaign_finances = CampaignFinance.all
  end

  def to_param
    id.to_s
  end
end
