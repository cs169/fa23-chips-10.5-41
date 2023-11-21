# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      ocdid_temp = ''
      title_temp = ''
      street = ''
      city = ''
      state = ''
      zip = ''
      political_party = ''
      profile = ''

      rep_info.offices.each do |office|
        if office.official_indices.include? index
          title_temp = office.name
          ocdid_temp = office.division_id
        end
      end
      if official.address
        address = official.address[0]
        street = address.line1
        city = address.city
        state = address.state
        zip = address.zip
      end
      party = official.political_party if official.political_party
      profile = official.profile if official.profile
      unless Representative.exists?(name: official.name, ocdid: ocdid_temp)
        rep = Representative.create!({ 
          name: official.name, 
          ocdid: ocdid_temp,
          title: title_temp,
          street:    street,
          city:      city,
          state:     state,
          zip:       zip,
          political_party:     political_party,
          profile: profile 
        })
        reps.push(rep)
      end
    end

    reps
  end
end
