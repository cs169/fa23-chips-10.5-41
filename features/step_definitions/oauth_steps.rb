# frozen_string_literal: true

When('I click on the Google login button') do
  # Implement the logic to click on the Google login button
end

Then('I should be redirected to the Google OAuth page') do
  # Assuming the URL of the Google OAuth page starts with "https://accounts.google.com/o/oauth2/auth"
  expected_url_prefix = 'https://accounts.google.com/o/oauth2/auth'

  # Wait for the redirection to happen and check the current URL
  expect(page).to have_current_path(/^#{Regexp.escape(expected_url_prefix)}/, wait: 10)
end

When('I log in with valid Google credentials') do
  # Mock the OmniAuth response for successful authentication
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                       provider: 'google_oauth2',
                                                                       uid:      '12345',
                                                                       info:     { email: 'user@example.com' }
                                                                     })
  click_on 'Login with Google'
end

Then('I should be redirected back to the application') do
  # Implement the assertion for successful redirection
end

Then('I should be logged in') do
  # Implement the assertion for user login status
end
