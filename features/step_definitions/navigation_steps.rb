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