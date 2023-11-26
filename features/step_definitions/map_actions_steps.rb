# frozen_string_literal: true

When(/^I visit the map page for state (.+)$/) do |state|
  visit "/state/#{state}"
end

When(/^I click on county (.+)$/) do |county|
  find_button('Counties in', exact_text: false).click
  row = find('table').find('tr', text: county)
  row.find_link('View').click
end

Then(/^I should see representative (.+)$/) do |representative|
  expect(page).to have_content(representative)
end

When /^(?:|I )go visit the state map page for (.+)$/ do |state_symbol|
  visit path_to('the state map page', state_symbol)
end
