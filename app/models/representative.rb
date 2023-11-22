# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Metrics/BlockLength, Metrics/CyclomaticComplexity, Metric/PerceivedComplexity
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
      political_party = official.party if official.party
      profile = official.photoUrl if official.respond_to?(:photoUrl) && official.photoUrl

      # Check if a representative with the same name and ocdid already exists
      existing_rep = Representative.find_by(name: official.name, ocdid: ocdid_temp)
      if existing_rep
        existing_rep.update!(
          title:           title_temp,
          street:          street,
          city:            city,
          state:           state,
          zip:             zip,
          political_party: political_party,
          profile:         profile
        )
        reps.push(existing_rep)
      else
        rep = Representative.create!({
                                       name:            official.name,
                                       ocdid:           ocdid_temp,
                                       title:           title_temp,
                                       street:          street,
                                       city:            city,
                                       state:           state,
                                       zip:             zip,
                                       political_party: political_party,
                                       profile:         profile
                                     })
        reps.push(rep)
      end
    end
    reps
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength, Metrics/BlockLength, Metrics/CyclomaticComplexity, Metric/PerceivedComplexity
end
