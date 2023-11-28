# frozen_string_literal: true

Given /^I am logged in with Google$/ do
  OmniAuth.config.add_mock(:google_oauth2, {
                             provider: 'google_oauth2',
                             uid:      '123',
                             info:     { email: 'test@example.com' }
                           })
  visit '/auth/google_oauth2/callback'
end
