require 'watir-webdriver'
require 'page-object'
include PageObject::PageFactory

DEPARTURE_CITY = 'CLE'
ARRIVAL_CITY = 'FLL'
DEPARTURE_DATE = '12/05'
ARRIVAL_DATE = '1/4'

Given(/^I am on the booking page$/) do
  visit_page(SouthwestHome)
end

When(/^I submit data with default dates$/) do
  on_page(SouthwestSearch) do |page|
    page.set_dates(DEPARTURE_DATE, ARRIVAL_DATE)
    page.search_flights(DEPARTURE_CITY, ARRIVAL_CITY)
  end
end

Then(/^the default dates should be highlighted$/) do
  sleep 2
  on_page(SouthwestSearch) do |page|
    expect(page.compare_dates).to be true
  end
end