# frozen_string_literal: true

require 'google/apis/civicinfo_v2'
require 'net/http'
require 'json'

class SearchController < ApplicationController
  def search_representatives
    address = params[:address]
    service = Google::Apis::CivicinfoV2::CivicInfoService.new
    service.key = Rails.application.credentials[:GOOGLE_API_KEY]
    result = service.representative_info_by_address(address: address)
    @representatives = Representative.civic_api_to_representative_params(result)

    render 'representatives/search'
  end

  def search_campaign_finances
    cycle = params[:cycle]
    category = params[:category]
    @category = params[:category]

    api_key = Rails.application.credentials[:PROPUBLICA_API_KEY]
    propublica_url = "https://api.propublica.org/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}.json"
    
    uri = URI(propublica_url)
    request = Net::HTTP::Get.new(uri)
    request['X-API-Key'] = api_key

    http = Net::HTTP.new(uri.hostname, uri.port)
    http.use_ssl = true if uri.scheme == 'https'

    response = http.request(request)
    
    if response.code == '200'
      result = JSON.parse(response.body)
      puts "API Result: #{result}"
      @representatives = CampaignFinance.propublica_api_to_representatives(result, cycle, category)
    else
      flash[:error] = "Error: help"
      @representatives = []
    end

    render 'campaign_finances/search'
  end
end
