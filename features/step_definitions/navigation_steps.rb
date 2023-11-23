require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

When(/^I click on the profile button for "([^"]*)"$/) do |name|
  within('table#events') do
    # Find the row with the specified name and click the profile button
    find('tr', text: name).click_on('Profile')
  end
end

When(/^I click on the news button for "([^"]*)"$/) do |name|
  within('table#events') do
    # Find the row with the specified name and click the news articles button
    find('tr', text: name).click_on('News Articles')
  end
end

Then(/^the table should have (\d+) rows$/) do |expected_rows|
  within('table') do
    actual_rows = all('tbody tr').count
    expect(actual_rows).to eq(expected_rows.to_i)
  end
end