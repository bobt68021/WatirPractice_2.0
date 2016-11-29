require 'watir-webdriver'
require 'page-object'
include PageObject::PageFactory

DEPARTURE_CITY = 'CLE'
ARRIVAL_CITY = 'FLL'

Given(/^I am on the booking page$/) do
  visit_page(SouthwestHome)
end

When(/^I submit data with default dates$/) do
  on_page(SouthwestSearch) do |page|
    page.set_dates
    page.search_flights(DEPARTURE_CITY, ARRIVAL_CITY)
    # alternative approach for reference:
    # page.depart = DEPARTURE_CITY
    # page.arrive = ARRIVAL_CITY
    # page.submit
  end
end

Then(/^the default dates should be highlighteds$/) do
  sleep 2
  on_page(SouthwestSearch) do |page|
    expect(page.compare_dates).to be true
  end
end