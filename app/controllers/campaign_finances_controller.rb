# frozen_string_literal: true

class CampaignFinancesController < ApplicationController
  def index
    @campaign_finances = CampaignFinance.all
    @cycles = CampaignFinance.cycles
    @categories = CampaignFinance.categories
  end

  def to_param
    id.to_s
  end

  def search
    # @campaign_finance = CampaignFinance.find(params[:id])
    @campaign_finances = CampaignFinance.find_from_top_twenty(params[:search])
  end
end
